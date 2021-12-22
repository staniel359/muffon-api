class AddUniqueIndexToArtists < ActiveRecord::Migration[7.0]
  def change
    add_index :artists, :name, unique: true
  end
end
