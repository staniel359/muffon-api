module LastFM
  module Track
    class Description < LastFM::API
      private

      def service_info
        {
          api_method: 'track.getInfo',
          response_data_node: 'track'
        }
      end

      def primary_args
        [@args.artist, @args.track]
      end

      def data
        {
          track: {
            title: response_data['name'],
            artist: response_data.dig('artist', 'name'),
            description: description
          }
        }
      end
    end
  end
end
