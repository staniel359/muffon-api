class AddPlaylistsColumnToMessages < ActiveRecord::Migration[7.0]
  def change
    add_column :messages, :playlists, :jsonb, array: true, default: []
  end
end
