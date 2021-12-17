class PlaylistTrack < ApplicationRecord
  belongs_to :playlist, counter_cache: true
  belongs_to :track
  belongs_to :artist
  belongs_to :album, optional: true

  has_one_attached :image

  validates :track_id,
            uniqueness: {
              scope: :playlist_id
            }

  class << self
    def associated
      includes(
        :track,
        :artist,
        :album,
        image_association
      )
    end
  end
end
