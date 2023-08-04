module Spotify
  module User
    class Playlists < Spotify::User::Base
      COLLECTION_NAME = 'playlists'.freeze

      include Spotify::Utils::Pagination

      private

      def link
        "#{super}/playlists"
      end

      def user_data
        playlists_data
          .merge(paginated_data)
      end

      def playlists_data
        {
          total_items:
            total_items_count
        }
      end

      def total_items_count
        response_data['total']
      end

      def collection_list
        response_data['items']
      end

      def collection_item_data_formatted(playlist)
        Spotify::User::Playlists::Playlist.call(
          playlist:,
          with_tracks: @args[:with_tracks]
        )
      end
    end
  end
end
