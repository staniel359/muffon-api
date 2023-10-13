class ChangeColumnsNull < ActiveRecord::Migration[7.1]
  def change
    change_column_null :communities, :profile_id, true

    change_column_null :conversations, :profile_id, true
    change_column_null :conversations, :other_profile_id, true

    change_column_null :messages, :profile_id, true

    change_column_null :posts, :profile_id, true

    change_column_null :post_comments, :profile_id, true
  end
end
