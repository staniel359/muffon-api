module AmazonMusic
  module Mixins
    module Artist
      include AmazonMusic::Mixins::Base

      private

      def name
        raw_artist_data.dig(
          'primaryText',
          'text'
        )
      end

      def amazonmusic_id
        amazonmusic_slug.match(
          %r{artists/(.+)/}
        )[1]
      end

      def amazonmusic_slug
        raw_artist_data.dig(
          'primaryLink',
          'deeplink'
        )
      end

      def source_original_link
        "#{WEB_BASE_URL}#{amazonmusic_slug}"
      end

      def image_data
        AmazonMusic::Formatter::Image.call(
          image_url:
        )
      end

      def image_url
        raw_artist_data['image']
      end
    end
  end
end
