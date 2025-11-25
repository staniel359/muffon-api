module Bandcamp
  module Search
    class Tracks < Bandcamp::Search::Base
      private

      def search_data
        paginated_data(
          collection_name: 'tracks',
          raw_collection:,
          page:,
          limit:,
          is_fractioned: true
        )
      end

      def payload
        {
          **super,
          search_filter: 't'
        }
      end

      def collection_item_data_formatted(track)
        Bandcamp::Search::Tracks::Track.call(
          track:,
          profile_id: @args[:profile_id],
          token: @args[:token]
        )
      end
    end
  end
end
