class PlaylistTrack < ApplicationRecord
  belongs_to :playlist, counter_cache: true

  validates :track_id,
            uniqueness: {
              scope: :playlist_id
            }
end
