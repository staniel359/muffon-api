class CreatePostComments < ActiveRecord::Migration[7.0]
  def change
    create_table :post_comments do |t|
      t.belongs_to :post,
                   null: false,
                   foreign_key: true

      t.belongs_to :profile,
                   null: false,
                   foreign_key: true

      t.boolean :by_community, default: false

      t.belongs_to :community,
                   null: true,
                   foreign_key: true

      t.text :text

      t.jsonb :tracks,
              array: true,
              default: []

      t.jsonb :albums,
              array: true,
              default: []

      t.jsonb :artists,
              array: true,
              default: []

      t.jsonb :playlists,
              array: true,
              default: []

      t.jsonb :communities,
              array: true,
              default: []

      t.jsonb :videos,
              array: true,
              default: []

      t.jsonb :video_playlists,
              array: true,
              default: []

      t.jsonb :video_channels,
              array: true,
              default: []

      t.timestamps
    end
  end
end
