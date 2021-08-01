class Artist < ApplicationRecord
  has_many :profile_artists, dependent: nil

  validates :name,
            presence: true,
            uniqueness: true

  class << self
    def with_name(name)
      where(
        'LOWER(name) = ?',
        name.strip.downcase
      ).first_or_create(
        name: name
      )
    end
  end

  def image_data
    return if image_url.blank?

    LastFM::Utils::Image.call(
      image: image_url, model: 'artist'
    )
  end
end
