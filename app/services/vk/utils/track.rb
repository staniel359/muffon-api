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

      def albums
        [album_data_formatted].compact
      end

      def album_data_formatted
        return if album.blank?

        {
          title: album['title'],
          vk_id: album['id'],
          vk_owner_id: album['owner_id'],
          vk_access_key: album['access_key']
        }
      end

      def album
        @album ||= track['album']
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
          source_id: self.class::SOURCE_ID
        }
      end
    end
  end
end
