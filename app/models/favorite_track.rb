class FavoriteTrack < ApplicationRecord
  belongs_to :profile
  belongs_to :track
  belongs_to :album, optional: true

  has_one_attached :image

  validates :track_id,
            uniqueness: {
              scope: :profile_id
            }

  class << self
    def associated
      includes(
        :album,
        [track: :artist],
        image_association
      )
    end
  end
end
