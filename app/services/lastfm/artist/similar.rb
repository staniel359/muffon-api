module LastFM
  module Artist
    class Similar < LastFM::API
      private

      def primary_args
        [@args.artist]
      end

      def parsed_response
        @parsed_response ||= JSON.parse(
          api_response('artist.getSimilar')
        )['similarartists']
      end

      def data
        { artist: similar_data }
      end

      def similar_data
        {
          name: parsed_response.dig('@attr', 'artist'),
          similar: similar
        }
      end

      def similar
        parsed_response['artist'].map { |a| a['name'] }
      end
    end
  end
end
