module LastFM
  module Artist
    class Images < LastFM::Artist::Web::Base
      COLLECTION_NAME = 'images'.freeze
      include LastFM::Utils::Web::Pagination
      include Muffon::Utils::Artist

      private

      def artist_data
        update_image if @args[:update]

        artist_base_data
          .merge(paginated_data)
      end

      def update_image
        return if first_image_data.blank?

        ::Artist::Image::UpdaterWorker.perform_async(
          artist_image_worker_args
        )
      end

      def first_image_data
        @first_image_data ||= collection[0]
      end

      def artist_image_worker_args
        {
          name: find_artist.name,
          image: first_image_data[:large]
        }.to_json
      end

      def artist_base_data
        super.merge(
          artist_image_data
        )
      end

      def artist_image_data
        return {} unless @args[:update]

        { image: first_image_data }
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
    end
  end
end
