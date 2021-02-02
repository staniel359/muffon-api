module LastFM
  module Album
    class Base < LastFM::API::Base
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

      def params
        super.merge(album_params)
      end

      def data
        { album: album_data }
      end

      def artist_name
        response_data['artist']
      end

      def listeners_count
        response_data['listeners'].to_i
      end
    end
  end
end
