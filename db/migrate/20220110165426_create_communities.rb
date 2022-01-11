class CreateCommunities < ActiveRecord::Migration[7.0]
  def change
    create_table :communities do |t|
      t.belongs_to :profile, null: false, foreign_key: true
      t.string :title
      t.text :description
      t.integer :members_count, default: 0

      t.timestamps
    end

    add_index :communities, :title, unique: true
  end
end
