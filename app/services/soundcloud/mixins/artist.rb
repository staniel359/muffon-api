module SoundCloud
  module Mixins
    module Artist
      private

      def name
        raw_artist_data['username']
      end

      def soundcloud_id
        raw_artist_data['id']
      end

      def source_original_link
        raw_artist_data['permalink_url']
      end

      def image_data
        SoundCloud::Formatter::Image.call(
          image_url:
        )
      end

      def image_url
        raw_artist_data['avatar_url']
      end
    end
  end
end
