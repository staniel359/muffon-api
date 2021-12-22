class AddUniqueIndexToPlaylists < ActiveRecord::Migration[7.0]
  def change
    add_index :playlists, [:title, :profile_id], unique: true
  end
end
