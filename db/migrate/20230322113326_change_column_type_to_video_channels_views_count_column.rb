class ChangeColumnTypeToVideoChannelsViewsCountColumn < ActiveRecord::Migration[7.0]
  def change
    change_column :video_channels, :views_count, :bigint
  end
end
