class ChangeListenersCountColumnsDefaultForArtistsAndAlbums < ActiveRecord::Migration[8.1]
  def change
    Artist
      .where(listeners_count: nil)
      .update_all(listeners_count: 0)

    change_column :artists,
      :listeners_count,
      :integer,
      null: false,
      default: 0

    Album
      .where(listeners_count: nil)
      .update_all(listeners_count: 0)

    change_column :albums,
      :listeners_count,
      :integer,
      null: false,
      default: 0
  end
end
