class Artist < ApplicationRecord
  include ArtistDecorator

  has_one_attached :image

  validates :name,
            presence: true,
            uniqueness: true
end
