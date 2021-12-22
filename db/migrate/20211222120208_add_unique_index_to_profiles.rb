class AddUniqueIndexToProfiles < ActiveRecord::Migration[7.0]
  def change
    add_index :profiles, :email, unique: true
    add_index :profiles, :nickname, unique: true
  end
end
