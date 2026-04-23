module YouTube
  module Search
    class Playlists < YouTube::Search::Base
      private

      def params
        {
          **super,
          type: SCOPES_TYPES_DATA['playlists']
        }
      end

      def search_data
        paginated_data(
          collection_name: 'playlists',
          raw_collection:,
          page:,
          limit:,
          is_infinite: true,
          previous_page:,
          next_page:
        )
      end

      def raw_collection
        super.reject do |collection_item|
          channel_item?(
            collection_item
          )
        end
      end

      def collection_item_data_formatted(
        raw_video_playlist_data
      )
        YouTube::Search::Playlists::Playlist.call(
          raw_video_playlist_data:,
          **self_args
        )
      end
    end
  end
end
