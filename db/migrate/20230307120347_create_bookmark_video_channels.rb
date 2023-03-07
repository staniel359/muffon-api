class CreateBookmarkVideoChannels < ActiveRecord::Migration[7.0]
  def change
    create_table :bookmark_video_channels do |t|
      t.belongs_to :video_channel,
                   null: false,
                   foreign_key: true

      t.belongs_to :profile,
                   null: false,
                   foreign_key: true

      t.timestamps
    end

    add_index :bookmark_video_channels,
              %i[
                video_channel_id
                profile_id
              ],
              unique: true,
              name: 'index_bookmark_video_channels_on_video_channel_and_profile'

    remove_index :bookmark_video_channels,
                 :video_channel_id
  end
end
