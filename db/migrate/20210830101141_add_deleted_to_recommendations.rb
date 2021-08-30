class AddDeletedToRecommendations < ActiveRecord::Migration[6.1]
  def change
    add_column :recommendations, :deleted, :boolean, default: false
  end
end
