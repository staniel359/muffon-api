class WatchedVideo < ApplicationRecord
  belongs_to :profile
  belongs_to :video

  validates :profile_id,
            uniqueness: {
              scope: :video_id
            }

  validates :video_id,
            uniqueness: {
              scope: :profile_id
            }
end
