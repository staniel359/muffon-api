class ChangeListenersCountColumnsDefaultForArtistsAndAlbums < ActiveRecord::Migration[8.1]
  def change
    change_column :artists,
      :listeners_count,
      :integer,
      null: false,
      default: 0

    change_column :albums,
      :listeners_count,
      :integer,
      null: false,
      default: 0
  end
end
