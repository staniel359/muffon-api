module LastFM
  module Artist
    class Images < LastFM::Artist::Web::Base
      COLLECTION_NAME = 'images'.freeze
      include LastFM::Utils::Web::Pagination
      include Muffon::Utils::Artist

      private

      def artist_data
        update_image if update_image?

        artist_base_data
          .merge(paginated_data)
      end

      def update_image?
        @args[:update] &&
          collection.present?
      end

      def collection_list
        response_data.css(
          '.image-list-item img'
        )
      end

      def link
        "#{base_link}/+images"
      end

      def collection_item_data_formatted(image)
        image_data_formatted(
          image['src']
        )
      end

      def update_image
        find_artist.update(
          image_url:
        )
      end

      def image_url
        collection.dig(
          0, :medium
        )
      end

      def artist_base_data
        super.merge(
          artist_image_data
        )
      end

      def artist_image_data
        return {} unless @args[:update]

        { image: image_data }
      end
    end
  end
end
