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
          id: soundcloud_id,
          links: source_links
        }
      end

      def soundcloud_id
        album['id']
      end

      def original_link
        album['permalink_url']
      end

      def streaming_link
        streaming_link_formatted(
          'album',
          soundcloud_id
        )
      end

      def image_data
        image_data_formatted(
          album['artwork_url']
        )
      end
    end
  end
end
