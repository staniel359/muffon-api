class CreateProfileAlbums < ActiveRecord::Migration[6.1]
  def change
    create_table :profile_albums do |t|
      t.belongs_to :profile, null: false, foreign_key: true
      t.belongs_to :album, null: false, foreign_key: true
      t.belongs_to :profile_artist, null: false, foreign_key: true

      t.timestamps
    end
  end
end
