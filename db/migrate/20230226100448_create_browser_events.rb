class CreateBrowserEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :browser_events do |t|
      t.belongs_to :profile, null: false, foreign_key: true
      t.jsonb :data

      t.timestamps
    end
  end
end
