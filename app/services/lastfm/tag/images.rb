module LastFM
  module Tag
    class Images < LastFM::Tag::Web::Base
      LIMIT = 20

      private

      def tag_data
        { images: }
      end

      def raw_images
        response_data
          .css('.big-artist-list-avatar-desktop img')
          .first(LIMIT)
      end

      def link
        "#{super}/artists"
      end

      def image_data_formatted(image)
        LastFM::Utils::Image.call(
          image: image['src']
        )[:small]
      end
    end
  end
end
