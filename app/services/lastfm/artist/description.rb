module LastFM
  module Artist
    class Description < LastFM::API
      private

      def service_info
        {
          api_method: 'artist.getInfo',
          response_data_node: 'artist'
        }
      end

      def primary_args
        [@args.artist]
      end

      def data
        {
          artist: {
            name: response_data['name'],
            description: description
          }
        }
      end
    end
  end
end
