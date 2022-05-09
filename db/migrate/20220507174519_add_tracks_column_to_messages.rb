class AddTracksColumnToMessages < ActiveRecord::Migration[7.0]
  def change
    add_column :messages, :tracks, :jsonb, array: true, default: []
  end
end
