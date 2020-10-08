module LastFM
  module Track
    class Similar < LastFM::API
      private

      def primary_args
        [@args.artist, @args.track]
      end

      def parsed_response
        @parsed_response ||= JSON.parse(
          api_response('track.getSimilar')
        )['similartracks']
      end

      def data
        { track: track_data }
      end

      def track_data
        {
          title: @args.track,
          artist: parsed_response.dig('@attr', 'artist'),
          similar: similar
        }
      end

      def similar
        parsed_response['track'].map do |t|
          {
            title: t['name'],
            artist: t.dig('artist', 'name')
          }
        end
      end
    end
  end
end
