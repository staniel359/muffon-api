class FavoriteArtist < ApplicationRecord
  include FavoriteArtistDecorator

  belongs_to :profile
  belongs_to :artist

  validates :artist_id,
            uniqueness: {
              scope: :profile_id
            }
end
