class AddListenersCountToTracks < ActiveRecord::Migration[8.1]
  def change
    add_column :tracks,
      :listeners_count,
      :integer,
      null: false,
      default: 0
  end
end
