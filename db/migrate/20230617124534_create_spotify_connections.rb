class CreateSpotifyConnections < ActiveRecord::Migration[7.0]
  def change
    create_table :spotify_connections do |t|
      t.belongs_to :profile, null: false, foreign_key: true
      t.string :spotify_id
      t.string :nickname
      t.string :image_url
      t.boolean :premium, default: false
      t.string :access_token
      t.string :refresh_token

      t.timestamps
    end
  end
end
