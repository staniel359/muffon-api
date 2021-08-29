class ProfileAlbum < ApplicationRecord
  belongs_to :profile
  belongs_to :profile_artist,
             counter_cache: true
  belongs_to :album

  has_many :profile_tracks,
           dependent: :destroy

  has_one_attached :image

  validates :album_id,
            uniqueness: {
              scope: :profile_id
            }
end
