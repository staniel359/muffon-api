class AddPlayingToProfiles < ActiveRecord::Migration[7.0]
  def change
    add_column :profiles, :playing, :jsonb
  end
end
