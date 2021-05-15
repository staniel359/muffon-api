module LastFM
  module Artist
    class Similar < LastFM::Artist::API::Paginated
      private

      def service_info
        {
          api_method: 'artist.getSimilar',
          response_data_node: 'similarartists'
        }
      end

      def collection_name
        'similar'
      end

      def model_name
        'artist'
      end

      def total_limit
        250
      end

      def collection_item_data(similar)
        { name: similar['name'] }
      end
    end
  end
end
