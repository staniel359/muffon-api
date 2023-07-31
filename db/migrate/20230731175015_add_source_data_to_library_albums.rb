class AddSourceDataToLibraryAlbums < ActiveRecord::Migration[7.0]
  def change
    add_column :library_albums, :source_data, :jsonb
  end
end
