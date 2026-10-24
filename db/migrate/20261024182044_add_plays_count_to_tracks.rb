class AddPlaysCountToTracks < ActiveRecord::Migration[8.1]
  def change
    add_column :tracks, :plays_count, :integer
  end
end
