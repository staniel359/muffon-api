class AddTracksColumnToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :tracks, :jsonb, array: true, default: []
  end
end
