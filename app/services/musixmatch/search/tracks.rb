module MusixMatch
  module Search
    class Tracks < MusixMatch::Search::Base
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

      def raw_collection
        response_data.dig(
          'pageProps',
          'data',
          'openSearch',
          'data',
          'opensearchTrackSearch',
          'body',
          'tracks'
        )
      end

      def collection_item_data_formatted(
        raw_track_data
      )
        MusixMatch::Search::Tracks::Track.call(
          raw_track_data:,
          profile_id: @args[:profile_id],
          token: @args[:token]
        )
      end
    end
  end
end
