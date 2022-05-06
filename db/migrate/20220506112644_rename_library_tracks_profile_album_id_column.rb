class RenameLibraryTracksProfileAlbumIdColumn < ActiveRecord::Migration[7.0]
  def change
    rename_column :library_tracks,
                  :profile_album_id,
                  :library_album_id
  end
end
