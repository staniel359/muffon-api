class CreateRecommendationTracks < ActiveRecord::Migration[7.0]
  def change
    create_table :recommendation_tracks do |t|
      t.belongs_to :profile,
                   null: false,
                   foreign_key: true

      t.belongs_to :track,
                   null: false,
                   foreign_key: true

      t.integer :library_track_ids,
                array: true,
                default: []

      t.boolean :deleted, default: false

      t.timestamps
    end

    add_index :recommendation_tracks,
              %i[profile_id track_id],
              unique: true

    remove_index :recommendation_tracks, :profile_id
    remove_index :recommendation_tracks, :track_id
  end
end
