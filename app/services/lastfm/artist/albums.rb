module LastFM
  module Artist
    class Albums < LastFM::Artist::API::Paginated
      private

      def model_name
        'album'
      end

      def collection_name
        'albums'
      end

      def total_limit
        300
      end

      def collection_item_data(album)
        {
          title: album['name'],
          images: images_data(album, 'album')
        }
      end
    end
  end
end
