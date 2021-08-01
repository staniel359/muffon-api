class ProfileArtist < ApplicationRecord
  belongs_to :profile
  belongs_to :artist

  has_many :profile_albums,
           dependent: :destroy
  has_many :profile_tracks,
           dependent: :destroy

  validates :artist_id,
            uniqueness: {
              scope: :profile_id
            }
end
