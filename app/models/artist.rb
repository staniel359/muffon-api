class Artist < ApplicationRecord
  include ArtistDecorator

  has_one_attached :image

  validates :name,
            presence: true

  validates :name_downcase,
            presence: true,
            uniqueness: true

  def update_tags
    return if tag_ids.present?

    Muffon::Worker::Artist::Tags::Updater.call(
      name:
    )
  end
end
