class ChangeUniqueIndexOfAlbums < ActiveRecord::Migration[7.0]
  def change
    remove_index :albums, [:title_downcase, :artist_id], unique: true
    remove_index :albums, :artist_id

    add_index :albums, [:artist_id, :title_downcase], unique: true
    add_index :albums, :title_downcase
  end
end
