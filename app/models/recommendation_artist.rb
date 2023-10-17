class RecommendationArtist < ApplicationRecord
  ORDERS = %w[
    library_artists_count_desc
    library_artists_count_asc
  ].freeze
  EVENT_CALLBACKS = %w[
    deleted
  ].freeze

  include RecommendationArtistDecorator
  include EventableArtist

  after_create :update_artist_tags

  belongs_to :profile
  belongs_to :artist

  validates :artist_id,
            uniqueness: {
              scope: :profile_id
            }
end