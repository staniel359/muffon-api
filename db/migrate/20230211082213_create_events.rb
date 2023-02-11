class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.references :eventable, polymorphic: true

      t.belongs_to :profile,
                   null: false,
                   foreign_key: true

      t.belongs_to :other_profile,
                   foreign_key: {
                    to_table: :profiles
                   }

      t.integer :event_type, null: false

      t.jsonb :eventable_data
      t.jsonb :updated_data

      t.timestamps
    end
  end
end
