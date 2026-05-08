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
        raw_user_data['items']
      end

      def request_url
        "#{super}/playlists"
      end

      def request_params
        {
          **super,
          limit:,
          offset:
        }
      end

      def items_count
        raw_user_data['total']
      end

      def collection_item_data_formatted(
        raw_playlist_data
      )
        Spotify::User::Playlists::Playlist.call(
          raw_playlist_data:,
          **self_args
        )
      end
    end
  end
end
