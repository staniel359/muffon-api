class Album < ApplicationRecord
  include AlbumDecorator

  has_many :library_albums, dependent: nil

  belongs_to :artist

  validates :title,
            presence: true,
            uniqueness: {
              scope: :artist_id
            }
end
