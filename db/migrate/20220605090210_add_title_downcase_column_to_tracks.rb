class AddTitleDowncaseColumnToTracks < ActiveRecord::Migration[7.0]
  def change
    add_column :tracks, :title_downcase, :string

    remove_index :tracks, [:title, :artist_id]
    add_index :tracks, [:title_downcase, :artist_id], unique: true
  end
end
