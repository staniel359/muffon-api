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

      def image_data
        image_data_formatted(
          track['photo'], 'track'
        )
      end

      def duration
        duration_formatted(
          track['duration']
        )
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
