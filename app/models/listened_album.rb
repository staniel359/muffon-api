class ListenedAlbum < ApplicationRecord
  has_one_attached :image

  belongs_to :profile
  belongs_to :album

  validates :album_id,
            uniqueness: {
              scope: :profile_id
            }
end
