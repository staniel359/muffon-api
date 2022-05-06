class RenameLibraryAlbumsProfileTracksCountColumn < ActiveRecord::Migration[7.0]
  def change
    rename_column :library_albums,
                  :profile_tracks_count,
                  :library_tracks_count
  end
end
