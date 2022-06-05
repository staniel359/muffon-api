class AddNameDowncaseToTags < ActiveRecord::Migration[7.0]
  def change
    add_column :tags, :name_downcase, :string

    remove_index :tags, :name
    add_index :tags, :name_downcase, unique: true
  end
end
