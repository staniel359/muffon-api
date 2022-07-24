class AddOnlineUpdatedAtToProfiles < ActiveRecord::Migration[7.0]
  def change
    add_column :profiles, :online_updated_at, :datetime
  end
end
