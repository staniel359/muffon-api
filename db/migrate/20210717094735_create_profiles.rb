class CreateProfiles < ActiveRecord::Migration[6.1]
  def change
    create_table :profiles do |t|
      t.string :email
      t.string :token
      t.string :password_digest
      t.string :nickname

      t.timestamps
    end
  end
end
