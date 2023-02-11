class WatchedVideo < ApplicationRecord
  EVENT_CALLBACKS = %w[
    created
    deleted
  ].freeze

  include EventableVideo

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
