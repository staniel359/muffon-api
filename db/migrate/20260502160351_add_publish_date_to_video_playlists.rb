class AddPublishDateToVideoPlaylists < ActiveRecord::Migration[8.1]
  def change
    add_column :video_playlists, :publish_date, :string
  end
end
