class Artist < ApplicationRecord
  include ArtistDecorator

  validates :name,
            presence: true

  validates :name_downcase,
            presence: true,
            uniqueness: true

  has_many :library_artists, dependent: nil

  has_many :profiles,
           through: :library_artists,
           dependent: nil

  def update_tags
    return if tag_ids.present?

    Muffon::Worker::Artist::Tags::Updater.call(
      name:
    )
  end
end
