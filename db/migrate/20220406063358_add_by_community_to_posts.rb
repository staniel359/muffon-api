class AddByCommunityToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :by_community, :boolean, default: false
  end
end
