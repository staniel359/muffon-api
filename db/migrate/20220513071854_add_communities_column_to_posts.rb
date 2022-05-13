class AddCommunitiesColumnToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :communities, :jsonb, array: true, default: []
  end
end
