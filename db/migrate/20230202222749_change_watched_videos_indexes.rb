class ChangeWatchedVideosIndexes < ActiveRecord::Migration[7.0]
  def change
    remove_index :watched_videos,
                 %i[profile_id video_id]

    add_index :watched_videos,
                 %i[video_id profile_id],
                 unique: true
  end
end
