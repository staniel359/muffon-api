class RenameProfileArtistsTable < ActiveRecord::Migration[7.0]
  def change
    rename_table :profile_artists, :library_artists
  end
end
