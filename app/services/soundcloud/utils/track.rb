module SoundCloud
  module Utils
    module Track
      include Muffon::Utils::Track

      private

      def title
        track['title']
      end

      def artist_name
        artist['username']
      end

      def artist
        track['user']
      end

      def source_data
        {
          name: source_name,
          id: soundcloud_id,
          links: source_links_data
        }
      end

      def soundcloud_id
        track['id']
      end

      def original_link
        track['permalink_url']
      end

      def streaming_link
        streaming_link_formatted(
          model: 'track',
          model_id: soundcloud_id
        )
      end

      def image_data
        image_data_formatted(
          track['artwork_url']
        )
      end

      def duration
        track['duration'] / 1_000
      end

      def audio_present?
        track['streamable']
      end
    end
  end
end
