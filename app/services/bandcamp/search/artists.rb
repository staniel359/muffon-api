module Bandcamp
  module Search
    class Artists < Bandcamp::Search::Base
      private

      def search_data
        paginated_data(
          collection_name: 'artists',
          raw_collection:,
          page:,
          limit:,
          is_fractioned: true
        )
      end

      def payload
        {
          **super,
          search_filter: 'b'
        }
      end

      def collection_item_data_formatted(artist)
        Bandcamp::Search::Artists::Artist.call(
          artist:,
          profile_id: @args[:profile_id],
          token: @args[:token]
        )
      end
    end
  end
end
