class CreateFavoriteTracks < ActiveRecord::Migration[6.1]
  def change
    create_table :favorite_tracks do |t|
      t.belongs_to :profile, null: false, foreign_key: true
      t.integer :track_id
      t.integer :album_id
      t.string :image_url

      t.timestamps
    end
  end
end
