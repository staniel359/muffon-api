module YouTube
  module Search
    class Playlists < YouTube::Search::Base
      private

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

      def params
        {
          **super,
          type: 'playlist'
        }
      end

      def raw_collection
        super.reject do |collection_item|
          channel_item?(
            collection_item
          )
        end
      end

      def collection_item_data_formatted(playlist)
        YouTube::Search::Playlists::Playlist.call(
          playlist:,
          profile_id: @args[:profile_id],
          token: @args[:token]
        )
      end
    end
  end
end
