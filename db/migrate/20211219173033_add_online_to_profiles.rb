class AddOnlineToProfiles < ActiveRecord::Migration[7.0]
  def change
    add_column :profiles, :online, :boolean, default: false
  end
end
