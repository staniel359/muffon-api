module Spotify
  module Utils
    module Track
      include Muffon::Utils::Track

      private

      def title
        raw_track_data['name']
      end

      def raw_artists
        raw_track_data.dig(
          'artists',
          'items'
        )
      end

      def source_data
        return if local?

        {
          name: source_name,
          id: spotify_id,
          links: source_links_data
        }
      end

      def local?
        raw_track_data['__typename'] == 'LocalTrack'
      end

      def spotify_id
        raw_track_data['uri'].sub(
          'spotify:track:',
          ''
        )
      end

      def original_link
        "https://open.spotify.com/track/#{spotify_id}"
      end

      def streaming_link
        return if spotify_id.blank?

        streaming_link_formatted(
          model: 'track',
          model_id: spotify_id
        )
      end

      def album_data
        return if raw_album_data.blank?

        {
          source: album_source_data,
          title: album_title
        }.compact
      end

      def raw_album_data
        raw_track_data['albumOfTrack']
      end

      def album_source_data
        return if local?

        {
          name: source_name,
          id: album_spotify_id
        }
      end

      def album_spotify_id
        raw_album_data['uri'].sub(
          'spotify:album:',
          ''
        )
      end

      def album_title
        raw_album_data['name']
      end

      def image_data
        image_data_formatted(
          raw_images
        )
      end

      def raw_images
        raw_album_data.dig(
          'coverArt',
          'sources'
        )
      end

      def duration
        raw_duration
          .fdiv(1_000)
          .round
      end

      def raw_duration
        raw_track_data.dig(
          'duration',
          'totalMilliseconds'
        )
      end

      def audio_present?
        return false if local?

        raw_track_data.dig(
          'playability',
          'playable'
        )
      end
    end
  end
end
