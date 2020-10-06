module LastFM
  module Search
    class Tracks < LastFM::Base
      def call
        return not_found_data if parsed_response.blank?

        { search: search_data }
      end

      private

      def parsed_response
        @parsed_response ||= JSON.parse(
          api_response('track.search')
        )['results']
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
