class Artist < ApplicationRecord
  include ArtistDecorator

  has_one_attached :image

  validates :name,
            presence: true

  validates :name_downcase,
            presence: true,
            uniqueness: true
end
