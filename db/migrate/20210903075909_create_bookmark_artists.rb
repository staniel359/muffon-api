class CreateBookmarkArtists < ActiveRecord::Migration[6.1]
  def change
    create_table :bookmark_artists do |t|
      t.belongs_to :profile, null: false, foreign_key: true
      t.integer :artist_id

      t.timestamps
    end
  end
end
