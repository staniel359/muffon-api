class RenameProfileAlbumsTable < ActiveRecord::Migration[7.0]
  def change
    rename_table :profile_albums, :library_albums
  end
end
