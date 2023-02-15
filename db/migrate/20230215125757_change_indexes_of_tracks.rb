class ChangeIndexesOfTracks < ActiveRecord::Migration[7.0]
  def change
    remove_index :tracks,
                 %i[
                   extra_title_downcase
                   title_downcase
                   artist_id
                 ]

    remove_index :tracks,
                 %i[
                   title_downcase
                   artist_id
                 ]

    add_index :tracks,
              %i[
                artist_id
                title_downcase
                extra_title_downcase
              ],
              unique: true,
              name: 'index_tracks_on_artist_id_and_title_and_extra_title'

    add_index :tracks, :title_downcase
    add_index :tracks, :extra_title_downcase
  end
end
