class AddListenersCountToArtists < ActiveRecord::Migration[6.1]
  def change
    add_column :artists, :listeners_count, :integer
  end
end
