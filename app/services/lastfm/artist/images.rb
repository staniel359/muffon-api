module LastFM
  module Artist
    class Images < LastFM::Artist::Web::Base
      COLLECTION_NAME = 'images'.freeze
      include LastFM::Utils::Web::Pagination
      include Muffon::Utils::Artist

      private

      def artist_data
        artist_base_data
          .merge(paginated_data)
      end

      def artist_base_data
        super.merge(
          artist_image_data
        )
      end

      def artist_image_data
        { image: first_image }
      end

      def first_image
        collection[0]
      end

      def collection_list
        @collection_list ||=
          response_data.css(
            '.image-list-item img'
          )
      end

      def link
        "#{base_link}/+images"
      end

      def collection_item_data_formatted(image)
        image_data_formatted(
          image['src'], 'artist'
        )
      end
    end
  end
end
