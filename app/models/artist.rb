class Artist < ApplicationRecord
  validates :name, presence: true

  def self.with_name(name)
    where(
      'LOWER(name) = ?', name.strip.downcase
    ).first_or_create(name: name)
  end

  def image
    return if image_url.blank?

    LastFM::Utils::Image.call(
      image: image_url
    )
  end
end
