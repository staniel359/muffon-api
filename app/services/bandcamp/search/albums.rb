module Bandcamp
  module Search
    class Albums < Bandcamp::Search::Base
      private

      def search_data
        paginated_data(
          collection_name: 'albums',
          raw_collection:,
          page:,
          limit:,
          is_fractioned: true
        )
      end

      def payload
        {
          **super,
          search_filter: 'a'
        }
      end

      def collection_item_data_formatted(album)
        Bandcamp::Search::Albums::Album.call(
          album:,
          profile_id: @args[:profile_id],
          token: @args[:token]
        )
      end
    end
  end
end
