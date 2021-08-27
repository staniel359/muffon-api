class CreateRecommendations < ActiveRecord::Migration[6.1]
  def change
    create_table :recommendations do |t|
      t.belongs_to :profile, null: false, foreign_key: true
      t.integer :artist_id
      t.integer :profile_artist_ids, array: true, default: []

      t.timestamps
    end
  end
end
