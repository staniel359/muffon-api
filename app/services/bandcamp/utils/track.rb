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
          links: source_links_data
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
          model: 'track',
          model_id: bandcamp_id
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
        raw_audio_link.present?
      end

      def raw_audio_link
        @raw_audio_link ||=
          track.dig(
            'streaming_url', 'mp3-128'
          )
      end

      def audio_link
        return unless audio_present?

        response =
          format_get_request(
            link: raw_audio_link,
            is_redirect: false
          )

        response.headers[:location]
      end
    end
  end
end
