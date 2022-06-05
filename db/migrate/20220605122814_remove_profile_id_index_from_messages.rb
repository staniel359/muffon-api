class RemoveProfileIdIndexFromMessages < ActiveRecord::Migration[7.0]
  def change
    remove_index :messages, :profile_id
  end
end
