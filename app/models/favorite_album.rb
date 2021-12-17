class FavoriteAlbum < ApplicationRecord
  belongs_to :profile
  belongs_to :album

  has_one_attached :image

  validates :album_id,
            uniqueness: {
              scope: :profile_id
            }

  class << self
    def associated
      includes(
        [album: :artist],
        image_association
      )
    end
  end
end
