module SoundCloud
  module Utils
    module Album
      private

      def title
        album['title']
      end

      def soundcloud_id
        album['id']
      end

      def artist
        @artist ||= album['user']
      end

      def image_data
        image_data_formatted(
          album['artwork_url'], 'album'
        )
      end
    end
  end
end
