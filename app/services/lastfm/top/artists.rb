module LastFM
  module Top
    class Artists < LastFM::Top::Base
      private

      def parsed_response
        @parsed_response ||= JSON.parse(
          api_response('chart.getTopArtists')
        )['artists']
      end

      def top_data
        { artists: artists, page: page }
      end

      def artists
        parsed_response['artist'].map { |a| a['name'] }
      end
    end
  end
end
