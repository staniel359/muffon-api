class CreatePlaylistTracks < ActiveRecord::Migration[6.1]
  def change
    create_table :playlist_tracks do |t|
      t.belongs_to :playlist, null: false, foreign_key: true
      t.integer :track_id
      t.integer :artist_id
      t.integer :album_id

      t.timestamps
    end
  end
end
