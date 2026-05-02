module LastFM
  module Artist
    class Images < LastFM::Artist::Web::Base
      include LastFM::Mixins::Web::Pagination

      private

      def artist_data
        update_artist_record! if update_image?

        {
          **super,
          image: (
            image_data if @args[:update].present?
          ),
          **images_data
        }.compact
      end

      def update_image?
        @args[:update].present? && image_url.present?
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

      def request_url
        "#{super}/+images"
      end

      def collection_item_data_formatted(
        raw_image_data
      )
        LastFM::Formatter::Image.call(
          image_url: raw_image_data['src']
        )
      end
    end
  end
end
