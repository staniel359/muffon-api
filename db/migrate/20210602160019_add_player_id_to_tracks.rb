class AddPlayerIdToTracks < ActiveRecord::Migration[6.1]
  def change
    add_column :tracks, :player_id, :string
  end
end
