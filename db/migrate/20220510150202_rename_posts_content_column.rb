class RenamePostsContentColumn < ActiveRecord::Migration[7.0]
  def change
    rename_column :posts, :content, :text
  end
end
