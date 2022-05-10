class AddAlbumsColumnToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :albums, :jsonb, array: true, default: []
  end
end
