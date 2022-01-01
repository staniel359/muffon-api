module VK
  module Utils
    module Track
      include Muffon::Utils::Track

      private

      def title
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

      def vk_id
        "#{track['owner_id']}_#{track['id']}"
      end

      def album_data
        return if album.blank?

        {
          source_id:,
          vk_id: album_id,
          vk_owner_id: album_owner_id,
          vk_access_key: album_access_key,
          title: album_title
        }
      end

      def album
        track['album']
      end

      def album_id
        album['id']
      end

      def album_owner_id
        album['owner_id']
      end

      def album_access_key
        album['access_key']
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

      def duration_seconds
        track['duration']
      end

      def audio_data
        {
          present: vk_id.present?,
          track_id: vk_id,
          source_id:
        }
      end
    end
  end
end
