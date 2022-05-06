class RenameRecommendationsProfileArtistIdsColumn < ActiveRecord::Migration[7.0]
  def change
    rename_column :recommendations,
                  :profile_artist_ids,
                  :library_artist_ids
  end
end
