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

  validates :artist_id,
            uniqueness: {
              scope: :profile_id
            }

  after_create_commit :handle_after_create_commit

  belongs_to :profile

  belongs_to :artist

  private

  def handle_after_create_commit
    update_artist_tags
  end
end
