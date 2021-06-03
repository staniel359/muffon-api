module LastFM
  module Artist
    class Images < LastFM::Artist::Web::Base
      COLLECTION_NAME = 'images'.freeze
      include LastFM::Utils::Web::Pagination

      private

      def no_data?
        collection_list.blank? || page_out_of_bounds?
      end

      def collection_list
        @collection_list ||= response_data.css(
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

      def artist_data
        { name: name }.merge(paginated_data)
      end
    end
  end
end
