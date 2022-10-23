class AddVideoPlaylistsColumnToMessages < ActiveRecord::Migration[7.0]
  def change
    add_column :messages,
               :video_playlists,
               :jsonb,
               array: true,
               default: []
  end
end
