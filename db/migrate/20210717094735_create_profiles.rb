class CreateProfiles < ActiveRecord::Migration[6.1]
  def change
    create_table :profiles do |t|
      t.string :email
      t.string :token
      t.string :password_digest
      t.string :nickname

      t.timestamps
    end

    add_index :profiles, :email, unique: true
    add_index :profiles, :token, unique: true
    add_index :profiles, :nickname, unique: true
  end
end
