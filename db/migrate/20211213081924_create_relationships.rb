class CreateRelationships < ActiveRecord::Migration[6.1]
  def change
    create_table :relationships do |t|
      t.belongs_to :profile, null: false, foreign_key: true
      t.belongs_to :other_profile,
        null: false,
        foreign_key: { to_table: :profiles }

      t.timestamps
    end
  end
end
