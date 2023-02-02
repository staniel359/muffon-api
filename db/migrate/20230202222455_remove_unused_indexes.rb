class RemoveUnusedIndexes < ActiveRecord::Migration[7.0]
  def change
    remove_index :watched_videos, :video_id
    remove_index :favorite_videos, :video_id
    remove_index :bookmark_videos, :video_id
  end
end
