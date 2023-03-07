class CreateBookmarkVideoPlaylists < ActiveRecord::Migration[7.0]
  def change
    create_table :bookmark_video_playlists do |t|
      t.belongs_to :video_playlist,
                   null: false,
                   foreign_key: true

      t.belongs_to :profile,
                   null: false,
                   foreign_key: true

      t.timestamps
    end

    add_index :bookmark_video_playlists,
              %i[
                video_playlist_id
                profile_id
              ],
              unique: true,
              name: 'index_bookmark_video_playlists_on_video_playlist_and_profile'

    remove_index :bookmark_video_playlists,
                 :video_playlist_id
  end
end
