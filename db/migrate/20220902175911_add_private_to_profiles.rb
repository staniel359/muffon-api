class AddPrivateToProfiles < ActiveRecord::Migration[7.0]
  def change
    add_column :profiles, :private, :boolean, default: false
  end
end
