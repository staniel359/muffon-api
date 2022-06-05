class AddTitleDowncaseColumnToAlbums < ActiveRecord::Migration[7.0]
  def change
    add_column :albums, :title_downcase, :string

    remove_index :albums, [:title, :artist_id]
    add_index :albums, [:title_downcase, :artist_id], unique: true
  end
end
