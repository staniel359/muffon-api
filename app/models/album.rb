class Album < ApplicationRecord
  include AlbumDecorator

  has_many :profile_albums, dependent: nil

  belongs_to :artist

  validates :title,
            presence: true,
            uniqueness: {
              scope: :artist_id
            }
end
