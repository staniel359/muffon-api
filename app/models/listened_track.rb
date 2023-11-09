class ListenedTrack < ApplicationRecord
  EVENT_CALLBACKS = %w[
    created
    deleted
  ].freeze

  include EventableTrack

  validates :track_id,
            uniqueness: {
              scope: :profile_id
            }

  belongs_to :profile
  belongs_to :track
end
