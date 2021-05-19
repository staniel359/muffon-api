class AddImageUrlToArtists < ActiveRecord::Migration[6.1]
  def change
    add_column :artists, :image_url, :string
  end
end
