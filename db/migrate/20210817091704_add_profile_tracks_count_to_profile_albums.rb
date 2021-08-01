class AddProfileTracksCountToProfileAlbums < ActiveRecord::Migration[6.1]
  def change
    add_column :profile_albums,
      :profile_tracks_count,
      :integer,
      default: 0
  end
end
