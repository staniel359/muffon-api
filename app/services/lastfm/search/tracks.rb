module LastFM
  module Search
    class Tracks < LastFM::API
      private

      def parsed_response
        @parsed_response ||= JSON.parse(
          api_response('track.search')
        )['results']
      end

      def data
        { search: search_data }
      end

      def search_data
        {
          query: { track: @args.track },
          results: tracks,
          page: parsed_response.dig(
            'opensearch:Query', 'startPage'
          ).to_i
        }
      end

      def tracks
        parsed_response.dig('trackmatches', 'track').map do |t|
          {
            title: t['name'],
            artist: t['artist'],
            listeners_count: t['listeners'].to_i
          }
        end
      end
    end
  end
end
