class RemoveIndexesFromConversations < ActiveRecord::Migration[7.0]
  def change
    remove_index :conversations, :profile_id
    remove_index :conversations, :other_profile_id
  end
end
