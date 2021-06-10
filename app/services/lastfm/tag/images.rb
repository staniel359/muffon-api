module LastFM
  module Tag
    class Images < LastFM::Tag::Web::Base
      COLLECTION_NAME = 'artists'.freeze

      private

      def data
        { tag: tag_data }
      end

      def tag_data
        { images: collection }
      end

      def collection_list
        response_data.css(
          '.big-artist-list-avatar-desktop img'
        ).first(15)
      end

      def collection_item_data_formatted(image)
        image['src'].sub(
          '/270x205', '/174s'
        )
      end
    end
  end
end
