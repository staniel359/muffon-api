class CreateMessages < ActiveRecord::Migration[6.1]
  def change
    create_table :messages do |t|
      t.belongs_to :conversation, null: false, foreign_key: true
      t.belongs_to :profile, null: false, foreign_key: true
      t.text :content
      t.integer :track_ids, array: true, default: []

      t.timestamps
    end
  end
end
