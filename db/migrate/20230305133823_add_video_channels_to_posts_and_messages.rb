class AddVideoChannelsToPostsAndMessages < ActiveRecord::Migration[7.0]
  def change
    add_column :posts,
               :video_channels,
               :jsonb,
               array: true,
               default: []

    add_column :messages,
               :video_channels,
               :jsonb,
               array: true,
               default: []
  end
end
