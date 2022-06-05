class ChangeConversationsIndexes < ActiveRecord::Migration[7.0]
  def change
    remove_index :conversations, [:other_profile_id, :profile_id]

    add_index :conversations, [:profile_id, :other_profile_id], unique: true
  end
end
