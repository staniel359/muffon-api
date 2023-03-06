class RemoveTitleDowncaseIndexFromAlbums < ActiveRecord::Migration[7.0]
  def change
    remove_index :albums, :title_downcase
  end
end
