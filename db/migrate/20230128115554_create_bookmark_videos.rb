class CreateBookmarkVideos < ActiveRecord::Migration[7.0]
  def change
    create_table :bookmark_videos do |t|
      t.belongs_to :video,
                   null: false,
                   foreign_key: true
      t.belongs_to :profile,
                   null: false,
                   foreign_key: true

      t.timestamps
    end

    add_index :bookmark_videos,
              %i[video_id profile_id],
              unique: true
  end
end
