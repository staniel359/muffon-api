class AddTokenIndexToProfiles < ActiveRecord::Migration[7.0]
  def change
    add_index :profiles, :token
  end
end
