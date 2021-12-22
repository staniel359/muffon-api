class AddUniqueIndexToRecommendations < ActiveRecord::Migration[7.0]
  def change
    add_index :recommendations, [:artist_id, :profile_id], unique: true
  end
end
