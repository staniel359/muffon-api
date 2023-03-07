class CreateVideoPlaylists < ActiveRecord::Migration[7.0]
  def change
    create_table :video_playlists do |t|
      t.string :youtube_id
      t.string :title
      t.string :channel_youtube_id
      t.string :channel_title
      t.text :description
      t.integer :videos_count, default: 0
      t.string :image_url
      t.string :publish_date

      t.timestamps
    end

    add_index :video_playlists,
              %i[
                youtube_id
                channel_youtube_id
              ],
              unique: true
  end
end
