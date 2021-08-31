class ListenedTrack < ApplicationRecord
  belongs_to :profile
  belongs_to :track

  validates :track_id,
            uniqueness: {
              scope: :profile_id
            }
end
