class RenameProfileAlbumsProfileArtistIdColumn < ActiveRecord::Migration[7.0]
  def change
    rename_column :profile_albums,
                  :profile_artist_id,
                  :library_artist_id
  end
end
