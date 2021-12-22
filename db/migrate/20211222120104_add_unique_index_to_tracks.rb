class AddUniqueIndexToTracks < ActiveRecord::Migration[7.0]
  def change
    add_index :tracks, [:title, :artist_id], unique: true
  end
end
