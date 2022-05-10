class RenameMessagesContentColumn < ActiveRecord::Migration[7.0]
  def change
    rename_column :messages, :content, :text
  end
end
