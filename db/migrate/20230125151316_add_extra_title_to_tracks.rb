class AddExtraTitleToTracks < ActiveRecord::Migration[7.0]
  def change
    add_column :tracks, :extra_title, :string
    add_column :tracks, :extra_title_downcase, :string

    add_index :tracks,
              [
                :extra_title_downcase,
                :title_downcase,
                :artist_id
              ],
              unique: true,
              name: 'index_tracks_on_title_and_extra_title_and_artist_id'
  end
end
