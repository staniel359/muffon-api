class RemoveImageUrlColumnFromModels < ActiveRecord::Migration[7.0]
  def change
    remove_column :artists, :image_url
    remove_column :bookmark_albums, :image_url
    remove_column :bookmark_tracks, :image_url
    remove_column :favorite_albums, :image_url
    remove_column :favorite_tracks, :image_url
    remove_column :listened_albums, :image_url
    remove_column :playlist_tracks, :image_url
    remove_column :profile_albums, :image_url
  end
end
