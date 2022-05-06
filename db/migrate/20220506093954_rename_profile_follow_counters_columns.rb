class RenameProfileFollowCountersColumns < ActiveRecord::Migration[7.0]
  def change
    rename_column :profiles, :follower_profiles_count, :followers_count
    rename_column :profiles, :following_profiles_count, :following_count
  end
end
