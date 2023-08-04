module LastFM
  module User
    class Playlists < LastFM::User::Web::Base
      COLLECTION_NAME = 'playlists'.freeze

      include Muffon::Utils::Pagination

      private

      def user_data
        user_base_data
          .merge(playlists_data)
          .merge(paginated_data)
      end

      def playlists_data
        {
          total_items:
            total_items_count
        }
      end

      def total_items_count
        raw_collection_list.size
      end

      def raw_collection_list
        response_data.css(
          '.playlisting-playlists-item'
        )
      end

      def link
        "#{base_link}/playlists"
      end

      def collection_list
        collection_paginated(
          raw_collection_list
        )
      end

      def collection_item_data_formatted(playlist)
        LastFM::User::Playlists::Playlist.call(
          playlist:,
          nickname: lastfm_nickname,
          skip_profile: true,
          with_tracks: @args[:with_tracks]
        )
      end
    end
  end
end
