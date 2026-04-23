class Artist < ApplicationRecord
  ORDERS = %w[
    listeners_count_desc
    listeners_count_asc
  ].freeze

  include ArtistDecorator

  validates :name,
            presence: true

  validates :name_downcase,
            presence: true,
            uniqueness: true

  has_many :library_artists,
           dependent: nil

  has_many :listened_artists,
           dependent: nil

  has_many :profiles,
           through: :library_artists,
           dependent: nil

  after_create_commit :handle_after_create_commit

  private

  def handle_after_create_commit
    update_tags unless test?
  end

  def update_tags
    Muffon::Worker::Artist::Tags::Updater.call(
      artist_name: name
    )
  end
end
