class Recommendation < ApplicationRecord
  include RecommendationDecorator

  after_create_commit :update_artist_tags

  belongs_to :profile
  belongs_to :artist

  validates :artist_id,
            uniqueness: {
              scope: :profile_id
            }
end
