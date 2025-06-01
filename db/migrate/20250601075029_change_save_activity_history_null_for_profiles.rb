class ChangeSaveActivityHistoryNullForProfiles < ActiveRecord::Migration[8.0]
  def change
    change_column_null :profiles,
      :save_activity_history,
      true
  end
end
