class AddCommunitiesColumnToMessages < ActiveRecord::Migration[7.0]
  def change
    add_column :messages, :communities, :jsonb, array: true, default: []
  end
end
