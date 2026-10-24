class AddPlaysCountToAlbums < ActiveRecord::Migration[8.1]
  def change
    add_column :albums, :plays_count, :integer
  end
end
