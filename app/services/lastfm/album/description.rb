module LastFM
  module Album
    class Description < LastFM::API
      private

      def service_info
        {
          api_method: 'album.getInfo',
          response_data_node: 'album'
        }
      end

      def primary_args
        [@args.artist, @args.album]
      end

      def data
        {
          album: {
            title: response_data['name'],
            artist: response_data['artist'],
            description: description
          }
        }
      end
    end
  end
end
