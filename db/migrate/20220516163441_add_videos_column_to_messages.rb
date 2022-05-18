class AddVideosColumnToMessages < ActiveRecord::Migration[7.0]
  def change
    add_column :messages, :videos, :jsonb, array: true, default: []
  end
end
