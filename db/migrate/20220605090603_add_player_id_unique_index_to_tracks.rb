class AddPlayerIdUniqueIndexToTracks < ActiveRecord::Migration[7.0]
  def change
    add_index :tracks, :player_id, unique: true
  end
end
