class AddProfileAlbumsCountToProfileArtists < ActiveRecord::Migration[6.1]
  def change
    add_column :profile_artists,
      :profile_albums_count,
      :integer,
      default: 0
  end
end
