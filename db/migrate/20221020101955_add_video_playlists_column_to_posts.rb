class AddVideoPlaylistsColumnToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :video_playlists, :jsonb, array: true, default: []
  end
end
