module Spotify
  module User
    class Playlists < Spotify::User::Base
      private

      def user_data
        paginated_data(
          collection_name: 'playlists',
          raw_collection:,
          page:,
          limit:,
          items_count:,
          is_with_items_count: true
        )
      end

      def raw_collection
        user['items']
      end

      def link
        "#{super}/playlists"
      end

      def params
        {
          **super,
          limit:,
          offset:
        }
      end

      def items_count
        user['total']
      end

      def collection_item_data_formatted(
        raw_playlist_data
      )
        Spotify::User::Playlists::Playlist.call(
          raw_playlist_data:,
          with_tracks: @args[:with_tracks],
          profile_id: @args[:profile_id]
        )
      end
    end
  end
end
