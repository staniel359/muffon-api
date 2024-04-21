class AddClientCredentialsToSpotifyConnections < ActiveRecord::Migration[7.1]
  def change
    add_column :spotify_connections,
      :client_id,
      :string

    add_column :spotify_connections,
      :client_secret,
      :string
  end
end
