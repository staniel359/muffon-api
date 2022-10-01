class Album < ApplicationRecord
  include AlbumDecorator

  has_many :library_albums, dependent: nil

  has_many :profiles,
           -> { distinct },
           through: :library_albums,
           dependent: nil

  belongs_to :artist

  validates :title,
            presence: true

  validates :title_downcase,
            presence: true,
            uniqueness: {
              scope: :artist_id
            }
end
