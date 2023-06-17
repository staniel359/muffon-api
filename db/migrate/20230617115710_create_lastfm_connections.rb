class CreateLastFMConnections < ActiveRecord::Migration[7.0]
  def change
    create_table :lastfm_connections do |t|
      t.belongs_to :profile, null: false, foreign_key: true
      t.string :nickname
      t.string :session_key
      t.string :image_url
      t.boolean :premium, default: false

      t.timestamps
    end

    remove_column :profiles, :lastfm_nickname
    remove_column :profiles, :lastfm_session_key
  end
end
