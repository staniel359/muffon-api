class AddImageUrlToProfileAlbums < ActiveRecord::Migration[6.1]
  def change
    add_column :profile_albums, :image_url, :string
  end
end
