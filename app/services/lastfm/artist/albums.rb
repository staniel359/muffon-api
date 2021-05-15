module LastFM
  module Artist
    class Albums < LastFM::Artist::API::Paginated
      private

      def service_info
        {
          api_method: 'artist.getTopAlbums',
          response_data_node: 'topalbums'
        }
      end

      def collection_name
        'albums'
      end

      def model_name
        'album'
      end

      def total_limit
        300
      end

      def collection_item_data(album)
        {
          title: album['name'],
          image: image_data(album, 'album')
        }
      end
    end
  end
end
