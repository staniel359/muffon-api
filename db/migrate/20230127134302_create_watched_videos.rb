class CreateWatchedVideos < ActiveRecord::Migration[7.0]
  def change
    create_table :watched_videos do |t|
      t.belongs_to :profile,
                   null: false,
                   foreign_key: true
      t.belongs_to :video,
                   null: false,
                   foreign_key: true

      t.timestamps
    end

    add_index :watched_videos,
              %i[profile_id video_id],
              unique: true
  end
end
