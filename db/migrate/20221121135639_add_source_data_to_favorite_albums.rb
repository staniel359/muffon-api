class AddSourceDataToFavoriteAlbums < ActiveRecord::Migration[7.0]
  def change
    add_column :favorite_albums, :source_data, :jsonb
  end
end
