class CreateProfileTracks < ActiveRecord::Migration[6.1]
  def change
    create_table :profile_tracks do |t|
      t.belongs_to :profile, null: false, foreign_key: true
      t.belongs_to :track, null: false, foreign_key: true
      t.belongs_to :profile_artist, null: false, foreign_key: true
      t.belongs_to :profile_album, foreign_key: true

      t.timestamps
    end
  end
end
