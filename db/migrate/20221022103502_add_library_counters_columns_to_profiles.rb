class AddLibraryCountersColumnsToProfiles < ActiveRecord::Migration[7.0]
  def change
    add_column :profiles,
               :library_artists_count,
               :integer,
               default: 0

    add_column :profiles,
               :library_albums_count,
               :integer,
               default: 0

    add_column :profiles,
               :library_tracks_count,
               :integer,
               default: 0
  end
end
