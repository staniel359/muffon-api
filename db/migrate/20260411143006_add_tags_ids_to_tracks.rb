class AddTagsIdsToTracks < ActiveRecord::Migration[8.1]
  def change
    add_column :tracks,
      :tags_ids,
      :integer,
      array: true,
      null: false,
      default: []
  end
end
