class RemoveTitleDowncaseIndexFromTracks < ActiveRecord::Migration[7.0]
  def change
    remove_index :tracks, :title_downcase
  end
end
