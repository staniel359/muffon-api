class AddTagsIdsToAlbums < ActiveRecord::Migration[8.1]
  def change
    add_column :albums,
      :tags_ids,
      :integer,
      array: true,
      null: false,
      default: []
  end
end
