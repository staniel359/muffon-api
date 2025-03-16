module Spotify
  module Track
    class Info < Spotify::Track::Base
      private

      def track_data
        self_data
          .merge(track_base_data)
          .merge(track_extra_data)
          .merge(with_more_data)
      end

      def track_base_data
        {
          source: source_data,
          player_id: player_source_id,
          title:,
          artist: artists_base_data,
          artists:
        }
      end

      def track_extra_data
        {
          album: album_data,
          image: image_data,
          profiles_count:,
          duration:,
          audio: audio_base_data
        }.compact
      end

      def audio_link
        audio_full_link ||
          audio_preview_link
      end

      def audio_full_link
        Spotify::Utils::Audio::Link.call(
          track_id: @args[:track_id],
          client_version:
        )
      end

      def audio_preview_link
        track['preview_url']
      end
    end
  end
end
