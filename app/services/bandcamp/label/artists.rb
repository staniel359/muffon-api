module Bandcamp
  module Label
    class Artists < Bandcamp::Label::Base
      private

      def collection_name
        'artists'
      end

      def artists_data
        paginated_collection.map { |a| artist_data(a) }
      end

      def collection_list
        response_data['artists']
      end

      def artist_data(artist)
        {
          name: artist['name'],
          bandcamp_id: artist['id'],
          bandcamp_model: 'artist',
          image: image_data(image(artist))
        }
      end

      def image(data)
        "https://f4.bcbits.com/img/00#{data['image_id']}_10.jpg"
      end
    end
  end
end
