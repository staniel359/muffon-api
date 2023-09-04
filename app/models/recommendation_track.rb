class RecommendationTrack < ApplicationRecord
  ORDERS = %w[
    library_tracks_count_desc
    library_tracks_count_asc
  ].freeze
  EVENT_CALLBACKS = %w[
    deleted
  ].freeze

  include RecommendationTrackDecorator
  include EventableTrack

  belongs_to :profile
  belongs_to :track

  validates :track_id,
            uniqueness: {
              scope: :profile_id
            }
end
