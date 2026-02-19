module MusixMatch
  module Search
    class Artists < MusixMatch::Search::Base
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

      def raw_collection
        response_data.dig(
          'pageProps',
          'data',
          'openSearch',
          'data',
          'opensearchTrackSearch',
          'body',
          'artists'
        )
      end

      def collection_item_data_formatted(
        raw_artist_data
      )
        MusixMatch::Search::Artists::Artist.call(
          raw_artist_data:,
          profile_id: @args[:profile_id],
          token: @args[:token]
        )
      end
    end
  end
end
