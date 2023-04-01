class ChangeColumnTypeToVideosViewsCountColumn < ActiveRecord::Migration[7.0]
  def change
    change_column :videos, :views_count, :bigint
  end
end
