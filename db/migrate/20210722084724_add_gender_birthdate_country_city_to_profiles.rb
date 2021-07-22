class AddGenderBirthdateCountryCityToProfiles < ActiveRecord::Migration[6.1]
  def change
    add_column :profiles, :gender, :integer
    add_column :profiles, :birthdate, :string
    add_column :profiles, :country, :string
    add_column :profiles, :city, :string
  end
end
