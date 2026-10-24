class AddPlaysCountToArtists < ActiveRecord::Migration[8.1]
  def change
    add_column :artists, :plays_count, :integer
  end
end
