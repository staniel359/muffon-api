class AddLastFMNicknameToProfiles < ActiveRecord::Migration[6.1]
  def change
    add_column :profiles, :lastfm_nickname, :string
  end
end
