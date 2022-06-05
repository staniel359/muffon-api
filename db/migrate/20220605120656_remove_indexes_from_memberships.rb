class RemoveIndexesFromMemberships < ActiveRecord::Migration[7.0]
  def change
    remove_index :memberships, :community_id
  end
end
