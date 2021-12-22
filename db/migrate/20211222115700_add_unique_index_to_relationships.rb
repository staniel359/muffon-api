class AddUniqueIndexToRelationships < ActiveRecord::Migration[7.0]
  def change
    add_index :relationships, [:other_profile_id, :profile_id], unique: true
  end
end
