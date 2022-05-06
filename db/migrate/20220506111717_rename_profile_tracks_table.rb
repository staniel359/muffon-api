class RenameProfileTracksTable < ActiveRecord::Migration[7.0]
  def change
    rename_table :profile_tracks, :library_tracks
  end
end
