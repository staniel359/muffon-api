class CreateListenedTracks < ActiveRecord::Migration[6.1]
  def change
    create_table :listened_tracks do |t|
      t.belongs_to :profile, null: false, foreign_key: true
      t.integer :track_id

      t.timestamps
    end
  end
end
