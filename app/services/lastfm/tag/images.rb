module LastFM
  module Tag
    class Images < LastFM::Tag::Web::Base
      COLLECTION_NAME = 'artists'.freeze

      private

      def tag_data
        { images: collection }
      end

      def collection_list
        response_data.css(
          '.big-artist-list-avatar-desktop img'
        ).first(20)
      end

      def collection_item_data_formatted(image)
        LastFM::Utils::Image.call(
          image: image['src']
        )[:small]
      end
    end
  end
end
