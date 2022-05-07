class AddPasswordResetCodeToProfiles < ActiveRecord::Migration[7.0]
  def change
    add_column :profiles, :password_reset_code, :integer
  end
end
