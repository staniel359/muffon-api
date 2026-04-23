class RenameTagIdsColumnOfArtists < ActiveRecord::Migration[8.1]
  def change
    rename_column :artists, :tag_ids, :tags_ids
  end
end
