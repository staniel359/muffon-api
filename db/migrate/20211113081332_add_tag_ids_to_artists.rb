class AddTagIdsToArtists < ActiveRecord::Migration[6.1]
  def change
    add_column :artists, :tag_ids, :integer, array: true, default: []
  end
end
