module LastFM
  module Artist
    class Similar < LastFM::API
      private

      def service_info
        {
          api_method: 'artist.getSimilar',
          response_data_node: 'similarartists'
        }
      end

      def primary_args
        [@args.artist]
      end

      def data
        { artist: similar_data }
      end

      def similar_data
        {
          name: response_data.dig('@attr', 'artist'),
          similar: similar
        }
      end

      def similar
        response_data['artist'].map { |a| a['name'] }
      end
    end
  end
end
