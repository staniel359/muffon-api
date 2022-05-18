class AddVideosColumnToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :videos, :jsonb, array: true, default: []
  end
end
