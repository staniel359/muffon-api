class AddImageUrlToArtists < ActiveRecord::Migration[7.0]
  def change
    add_column :artists, :image_url, :string
  end
end
