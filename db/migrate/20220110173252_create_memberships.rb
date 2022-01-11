class CreateMemberships < ActiveRecord::Migration[7.0]
  def change
    create_table :memberships do |t|
      t.belongs_to :profile, null: false, foreign_key: true
      t.belongs_to :community, null: false, foreign_key: true

      t.timestamps
    end

    add_index :memberships, [:community_id, :profile_id], unique: true
  end
end
