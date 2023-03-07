class CreateVideoChannels < ActiveRecord::Migration[7.0]
  def change
    create_table :video_channels do |t|
      t.string :youtube_id
      t.string :title
      t.integer :videos_count, default: 0
      t.integer :subscribers_count, default: 0
      t.integer :views_count, default: 0
      t.string :image_url

      t.timestamps
    end
  end
end
