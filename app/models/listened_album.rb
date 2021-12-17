class ListenedAlbum < ApplicationRecord
  belongs_to :profile
  belongs_to :album

  has_one_attached :image

  validates :album_id,
            uniqueness: {
              scope: :profile_id
            }
end
