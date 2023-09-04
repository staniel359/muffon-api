class AddForeignKeyToRecommendationArtists < ActiveRecord::Migration[7.0]
  def change
    change_column :recommendation_artists,
                  :artist_id,
                  :bigint,
                  null: false

    add_foreign_key :recommendation_artists, :artists
  end
end
