class ChangeRecommendationsIndexes < ActiveRecord::Migration[7.0]
  def change
    remove_index :recommendations, [:artist_id, :profile_id]
    remove_index :recommendations, :profile_id

    add_index :recommendations, [:profile_id, :artist_id], unique: true
  end
end
