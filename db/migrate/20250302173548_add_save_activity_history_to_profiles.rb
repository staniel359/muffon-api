class AddSaveActivityHistoryToProfiles < ActiveRecord::Migration[8.0]
  def change
    add_column :profiles,
      :save_activity_history,
      :boolean,
      null: false,
      default: true
  end
end
