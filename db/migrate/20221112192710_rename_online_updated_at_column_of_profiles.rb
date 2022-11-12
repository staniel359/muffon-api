class RenameOnlineUpdatedAtColumnOfProfiles < ActiveRecord::Migration[7.0]
  def change
    rename_column :profiles, :online_updated_at, :was_online_at
  end
end
