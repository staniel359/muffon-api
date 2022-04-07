class AddPostTypeToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :post_type, :integer
  end
end
