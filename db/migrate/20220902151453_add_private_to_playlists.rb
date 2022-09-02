class AddPrivateToPlaylists < ActiveRecord::Migration[7.0]
  def change
    add_column :playlists, :private, :boolean, default: false
  end
end
