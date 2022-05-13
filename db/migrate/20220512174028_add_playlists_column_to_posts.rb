class AddPlaylistsColumnToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :playlists, :jsonb, array: true, default: []
  end
end
