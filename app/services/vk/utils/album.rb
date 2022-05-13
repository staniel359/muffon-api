module VK
  module Utils
    module Album
      include Muffon::Utils::Album

      private

      def title
        album['title']
      end

      def artists_list
        album['main_artists'] || [artist]
      end

      def artist
        { 'name' => album['artist'] }
      end

      def source_data
        {
          name: source_name,
          id: album['id'],
          owner_id: album['owner_id'],
          access_key: album['access_key']
        }
      end

      def extra_title
        album['subtitle']
      end

      def image_data
        image_data_formatted(
          album['photo'], 'album'
        )
      end

      def release_date
        date_formatted(
          album['create_time']
        )
      end
    end
  end
end
