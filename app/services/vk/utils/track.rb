module VK
  module Utils
    module Track
      include Muffon::Utils::Track

      private

      def title
        title_formatted(
          raw_title,
          extra_title
        )
      end

      def raw_title
        track['title']
      end

      def extra_title
        track['subtitle']
      end

      def artists_list
        track['main_artists'] || [artist]
      end

      def artist
        { 'name' => track['artist'] }
      end

      def source_data
        {
          name: source_name,
          id: vk_id,
          links: source_links
        }
      end

      def vk_id
        "#{track['owner_id']}_#{track['id']}"
      end

      def original_link
        "https://vk.ru/audio#{vk_id}"
      end

      def album_data
        return if album.blank?

        {
          source: album_source_data,
          title: album_title
        }
      end

      def album
        track['album']
      end

      def album_source_data
        {
          name: source_name,
          id: album['id'],
          owner_id: album['owner_id'],
          access_key: album['access_key']
        }
      end

      def album_title
        album['title']
      end

      def image_data
        image_data_formatted(
          album_image_data, 'track'
        )
      end

      def album_image_data
        album.try(:[], 'thumb')
      end

      def duration
        track['duration']
      end

      def audio_present?
        true
      end
    end
  end
end
