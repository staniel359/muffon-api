module VK
  module Utils
    module Album
      include Muffon::Utils::Album

      private

      def title
        album['title']
      end

      def extra_title
        album['subtitle']
      end

      def vk_id
        album['id']
      end

      def vk_owner_id
        album['owner_id']
      end

      def vk_access_key
        album['access_key']
      end

      def artist_name
        artist_names
      end

      def artists_list
        album['main_artists'] ||
          [artist]
      end

      def artist
        { 'name' => album['artist'] }
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
