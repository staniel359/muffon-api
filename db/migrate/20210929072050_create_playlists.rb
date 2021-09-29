class CreatePlaylists < ActiveRecord::Migration[6.1]
  def change
    create_table :playlists do |t|
      t.belongs_to :profile, null: false, foreign_key: true
      t.string :title
      t.integer :playlist_tracks_count, default: 0

      t.timestamps
    end
  end
end
