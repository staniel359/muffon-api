class AddImageUrlToPlaylistTracks < ActiveRecord::Migration[6.1]
  def change
    add_column :playlist_tracks, :image_url, :string
  end
end
