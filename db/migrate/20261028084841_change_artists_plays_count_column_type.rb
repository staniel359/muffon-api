class ChangeArtistsPlaysCountColumnType < ActiveRecord::Migration[8.1]
  def up
    change_column :artists, :plays_count, :bigint
  end

  def down
    change_column :artists, :plays_count, :integer
  end
end
