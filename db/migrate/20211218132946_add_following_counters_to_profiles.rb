class AddFollowingCountersToProfiles < ActiveRecord::Migration[7.0]
  def change
    add_column :profiles, :following_profiles_count, :integer, default: 0
    add_column :profiles, :follower_profiles_count, :integer, default: 0
  end
end
