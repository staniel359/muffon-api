class FavoriteArtist < ApplicationRecord
  belongs_to :profile
  belongs_to :artist

  validates :artist_id,
            uniqueness: {
              scope: :profile_id
            }

  class << self
    def associated
      includes(
        artist: image_association
      )
    end
  end
end
