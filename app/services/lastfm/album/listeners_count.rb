module LastFM
  module Album
    class ListenersCount < LastFM::API
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
        { listeners_count: response_data['listeners'].to_i }
      end
    end
  end
end
