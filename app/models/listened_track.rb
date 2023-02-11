class ListenedTrack < ApplicationRecord
  EVENT_CALLBACKS = %w[
    created
    deleted
  ].freeze

  include EventableTrack

  belongs_to :profile
  belongs_to :track

  validates :track_id,
            uniqueness: {
              scope: :profile_id
            }
end
