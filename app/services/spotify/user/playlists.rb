module Spotify
  module User
    class Playlists < Spotify::User::Base
      COLLECTION_NAME = 'playlists'.freeze

      include Spotify::Utils::Pagination

      private

      def user_data
        {
          total_items: total_items_count,
          **paginated_data
        }
      end

      def total_items_count
        user['total']
      end

      def link
        "#{super}/playlists"
      end

      def collection_list
        user['items']
      end

      def collection_item_data_formatted(playlist)
        Spotify::User::Playlists::Playlist.call(
          playlist:,
          with_tracks: @args[:with_tracks],
          profile_id: @args[:profile_id]
        )
      end
    end
  end
end
