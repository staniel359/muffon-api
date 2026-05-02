class AddPublishDateToVideos < ActiveRecord::Migration[8.1]
  def change
    add_column :videos, :publish_date, :string
  end
end
