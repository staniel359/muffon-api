class AddStatusToProfiles < ActiveRecord::Migration[7.0]
  def change
    add_column :profiles, :status, :text
  end
end
