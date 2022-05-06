class RenameLibraryArtistsCountersColumns < ActiveRecord::Migration[7.0]
  def change
    rename_column :library_artists,
                  :profile_tracks_count,
                  :library_tracks_count

    rename_column :library_artists,
                  :profile_albums_count,
                  :library_albums_count
  end
end
