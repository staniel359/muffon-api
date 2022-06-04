class AddNameDowncaseColumnToArtists < ActiveRecord::Migration[7.0]
  def change
    add_column :artists, :name_downcase, :string

    remove_index :artists, :name
    add_index :artists, :name_downcase, unique: true
  end
end
