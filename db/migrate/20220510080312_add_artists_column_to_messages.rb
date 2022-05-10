class AddArtistsColumnToMessages < ActiveRecord::Migration[7.0]
  def change
    add_column :messages, :artists, :jsonb, array: true, default: []
  end
end
