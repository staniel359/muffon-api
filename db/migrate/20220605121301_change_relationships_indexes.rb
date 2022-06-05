class ChangeRelationshipsIndexes < ActiveRecord::Migration[7.0]
  def change
    remove_index :relationships, [:other_profile_id, :profile_id]
    remove_index :relationships, :profile_id

    add_index :relationships, [:profile_id, :other_profile_id], unique: true
  end
end
