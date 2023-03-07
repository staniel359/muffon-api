class RemovePublishDateColumns < ActiveRecord::Migration[7.0]
  def change
    remove_column :videos, :publish_date
    remove_column :video_playlists, :publish_date
  end
end
