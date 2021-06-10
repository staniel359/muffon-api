class AddListenersCountToAlbums < ActiveRecord::Migration[6.1]
  def change
    add_column :albums, :listeners_count, :integer
  end
end
