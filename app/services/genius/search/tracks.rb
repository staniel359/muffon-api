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

      def link
        "#{BASE_LINK}/search/song"
      end

      def collection_item_data_formatted(track)
        Genius::Search::Tracks::Track.call(
          track: track['result'],
          profile_id: @args[:profile_id],
          token: @args[:token]
        )
      end
    end
  end
end
