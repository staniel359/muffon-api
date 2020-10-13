module LastFM
  module Track
    class Similar < LastFM::API
      private

      def service_info
        {
          api_method: 'track.getSimilar',
          response_data_node: 'similartracks'
        }
      end

      def primary_args
        [@args.artist, @args.track]
      end

      def data
        { track: track_data }
      end

      def track_data
        {
          title: @args.track,
          artist: response_data.dig('@attr', 'artist'),
          similar: similar
        }
      end

      def similar
        response_data['track'].map do |t|
          {
            title: t['name'],
            artist: t.dig('artist', 'name')
          }
        end
      end
    end
  end
end
