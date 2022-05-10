class AddAlbumsColumnToMessages < ActiveRecord::Migration[7.0]
  def change
    add_column :messages, :albums, :jsonb, array: true, default: []
  end
end
