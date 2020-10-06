module LastFM
  module Search
    class Artists < LastFM::Base
      def call
        return not_found_data if parsed_response.blank?

        { search: search_data }
      end

      private

      def parsed_response
        @parsed_response ||= JSON.parse(
          api_response('artist.search')
        )['results']
      end

      def search_data
        {
          query: { artist: @args.artist_name },
          results: artists,
          page: parsed_response.dig(
            'opensearch:Query', 'startPage'
          ).to_i
        }
      end

      def artists
        parsed_response.dig('artistmatches', 'artist').map do |a|
          {
            name: a['name'],
            listeners_count: a['listeners'].to_i
          }
        end
      end
    end
  end
end
