class CreateProfilePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :profile_posts do |t|
      t.belongs_to :profile, null: false, foreign_key: true
      t.belongs_to :other_profile,
        null: false,
        foreign_key: { to_table: :profiles }
      t.text :content
      t.integer :track_ids, array: true, default: []

      t.timestamps
    end
  end
end
