class ListenedAlbum < ApplicationRecord
  belongs_to :profile
  belongs_to :album

  validates :album_id,
            uniqueness: {
              scope: :profile_id
            }
end
