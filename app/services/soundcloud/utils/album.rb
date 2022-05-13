module SoundCloud
  module Utils
    module Album
      include Muffon::Utils::Album

      private

      def title
        album['title']
      end

      def artist_name
        artist['username']
      end

      def artist
        album['user']
      end

      def source_data
        {
          name: source_name,
          id: album['id']
        }
      end

      def image_data
        image_data_formatted(
          album['artwork_url']
        )
      end
    end
  end
end
