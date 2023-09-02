class ChangeRecommendationsToRecommendationArtists < ActiveRecord::Migration[7.0]
  def change
    rename_table :recommendations, :recommendation_artists
  end
end
