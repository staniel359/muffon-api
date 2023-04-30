module VK
  module Utils
    module Album
      include Muffon::Utils::Album

      private

      def title
        title_formatted(
          raw_title,
          extra_title
        )
      end

      def raw_title
        album['title']
      end

      def extra_title
        album['subtitle']
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
          id: vk_id,
          owner_id: vk_owner_id,
          access_key: vk_access_key,
          links: source_links
        }
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

      def original_link
        "https://vk.com/music/album/#{vk_full_id}"
      end

      def vk_full_id
        "#{vk_owner_id}_#{vk_id}_#{vk_access_key}"
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
