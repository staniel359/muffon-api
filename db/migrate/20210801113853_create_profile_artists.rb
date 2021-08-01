class CreateProfileArtists < ActiveRecord::Migration[6.1]
  def change
    create_table :profile_artists do |t|
      t.belongs_to :profile, null: false, foreign_key: true
      t.belongs_to :artist, null: false, foreign_key: true

      t.timestamps
    end
  end
end
