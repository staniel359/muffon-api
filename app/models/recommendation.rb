class Recommendation < ApplicationRecord
  ORDERS = %w[
    library_artists_count_desc
    library_artists_count_asc
  ].freeze

  include RecommendationDecorator

  after_create_commit :update_artist_tags

  belongs_to :profile
  belongs_to :artist

  validates :artist_id,
            uniqueness: {
              scope: :profile_id
            }
end
