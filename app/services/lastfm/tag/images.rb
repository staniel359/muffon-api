module LastFM
  module Tag
    class Images < LastFM::Tag::Web::Base
      LIMIT = 20

      include LastFM::Mixins::Tag

      private

      def tag_data
        { images: }
      end

      def raw_images
        response_data
          .css('.big-artist-list-avatar-desktop img')
          .first(LIMIT)
      end

      def request_url
        "#{super}/artists"
      end

      def image_data_formatted(
        raw_image_data
      )
        image_url = raw_image_data['src']

        LastFM::Formatter::Image.call(
          image_url:
        ).try(
          :[],
          :small
        )
      end
    end
  end
end
