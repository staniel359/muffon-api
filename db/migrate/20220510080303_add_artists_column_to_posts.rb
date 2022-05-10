class AddArtistsColumnToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :artists, :jsonb, array: true, default: []
  end
end
