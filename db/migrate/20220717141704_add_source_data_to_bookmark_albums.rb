class AddSourceDataToBookmarkAlbums < ActiveRecord::Migration[7.0]
  def change
    add_column :bookmark_albums, :source_data, :jsonb
  end
end
