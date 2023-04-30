module SoundCloud
  module Utils
    module Artist
      include Muffon::Utils::Artist

      private

      def name
        artist['username']
      end

      def source_data
        {
          name: source_name,
          id: soundcloud_id,
          links: source_links
        }
      end

      def soundcloud_id
        artist['id']
      end

      def original_link
        artist['permalink_url']
      end

      def image_data
        image_data_formatted(
          artist['avatar_url']
        )
      end
    end
  end
end
