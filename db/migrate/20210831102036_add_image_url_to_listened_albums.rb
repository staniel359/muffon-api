class AddImageUrlToListenedAlbums < ActiveRecord::Migration[6.1]
  def change
    add_column :listened_albums, :image_url, :string
  end
end
