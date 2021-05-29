module VK
  module Utils
    module Track
      private

      def title
        CGI.unescapeHTML(track[3])
      end

      def extra_title
        CGI.unescapeHTML(
          track[16] || ''
        ).presence
      end

      def artists
        [artist_data_formatted]
      end

      def artist_data_formatted
        { name: artist_name }
      end

      def artist_name
        CGI.unescapeHTML(track[4])
      end

      def image_data
        image_data_formatted(
          track[14].split(',').last, 'track'
        )
      end

      def duration
        duration_formatted(track[5])
      end

      def vk_id
        [
          track[1], track[0],
          hashes[1], hashes[2]
        ].join('_')
      end

      def hashes
        @hashes ||= track[13].split(
          '/'
        ).reject(&:blank?)
      end

      def audio_data
        {
          present: audio_present?,
          track_id: vk_id,
          source_id: self.class::SOURCE_ID
        }
      end

      def audio_present?
        hashes.size == 3
      end
    end
  end
end
