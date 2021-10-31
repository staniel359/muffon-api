class AddLastFMSessionKeyToProfiles < ActiveRecord::Migration[6.1]
  def change
    add_column :profiles, :lastfm_session_key, :string
  end
end
