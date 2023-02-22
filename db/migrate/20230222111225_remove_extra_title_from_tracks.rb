class RemoveExtraTitleFromTracks < ActiveRecord::Migration[7.0]
  def change
    remove_index :tracks,
                 %i[
                   artist_id
                   title_downcase
                   extra_title_downcase
                 ]

    remove_index :tracks, :extra_title_downcase

    remove_column :tracks, :extra_title
    remove_column :tracks, :extra_title_downcase

    add_index :tracks,
              %i[
                artist_id
                title_downcase
              ],
              unique: true
  end
end
