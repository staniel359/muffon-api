class Album < ApplicationRecord
  include AlbumDecorator

  validates :title,
            presence: true

  validates :title_downcase,
            presence: true,
            uniqueness: {
              scope: :artist_id
            }

  has_many :library_albums,
           dependent: nil

  has_many :profiles,
           -> { distinct },
           through: :library_albums,
           dependent: nil

  belongs_to :artist

  after_create_commit :handle_after_create_commit

  private

  def handle_after_create_commit
    update_tags unless test?
  end

  def update_tags
    Muffon::Worker::Album::Tags::Updater.call(
      artist_name: artist.name,
      album_title: title
    )
  end
end
