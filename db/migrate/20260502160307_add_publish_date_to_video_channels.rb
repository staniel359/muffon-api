class AddPublishDateToVideoChannels < ActiveRecord::Migration[8.1]
  def change
    add_column :video_channels, :publish_date, :string
  end
end
