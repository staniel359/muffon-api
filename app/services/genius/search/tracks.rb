module Genius
  module Search
    class Tracks < Genius::Search::Base
      private

      def search_data
        paginated_data(
          collection_name: 'tracks',
          raw_collection:,
          page:,
          limit:,
          is_infinite: true,
          next_page:
        )
      end

      def request_url
        "#{REQUEST_BASE_URL}/search/song"
      end

      def collection_item_data_formatted(
        raw_track_data
      )
        Genius::Search::Tracks::Track.call(
          raw_track_data:,
          **self_args
        )
      end
    end
  end
end
