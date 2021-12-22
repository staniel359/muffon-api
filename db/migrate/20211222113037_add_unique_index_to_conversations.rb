class AddUniqueIndexToConversations < ActiveRecord::Migration[7.0]
  def change
    add_index :conversations, [:other_profile_id, :profile_id], unique: true
  end
end
