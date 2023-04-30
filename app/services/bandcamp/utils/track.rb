module Bandcamp
  module Utils
    module Track
      include Muffon::Utils::Track

      private

      def title
        track['title']
      end

      def source_data
        {
          name: source_name,
          id: bandcamp_id,
          artist_id: artist_bandcamp_id,
          model: 'track',
          links: source_links
        }
      end

      def bandcamp_id
        track['track_id']
      end

      def original_link
        response_data['bandcamp_url']
      end

      def streaming_link
        streaming_link_formatted(
          'track',
          bandcamp_id
        )
      end

      def artist_data
        {
          source: artist_source_data,
          name: artist_name
        }
      end

      def artist_source_data
        {
          name: source_name,
          id: artist_bandcamp_id
        }
      end

      def artist_bandcamp_id
        track['band_id']
      end

      def artist_name
        track['band_name'] ||
          'Various Artists'
      end

      def duration
        track['duration'].to_i
      end

      def audio_present?
        audio_link.present?
      end

      def audio_link
        track.dig(
          'streaming_url', 'mp3-128'
        )
      end
    end
  end
end
