module LastFM
  module Artist
    class Images < LastFM::Artist::Web::Base
      include LastFM::Utils::Web::Pagination
      include Muffon::Utils::Artist

      private

      def artist_data
        update_image! if update_image?

        {
          **super,
          image: (
            image_data if @args[:update].present?
          ),
          **images_data
        }.compact
      end

      def update_image?
        @args[:update].present? &&
          image_url.present?
      end

      def image_url
        images_data.dig(
          :images,
          0,
          :medium
        )
      end

      def images_data
        paginated_data(
          collection_name: 'images',
          raw_collection:,
          page:,
          limit:,
          pages_count:
        )
      end

      def raw_collection
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

      def update_image!
        find_artist.update!(
          image_url:
        )
      end
    end
  end
end
