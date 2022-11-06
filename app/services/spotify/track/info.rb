module Spotify
  module Track
    class Info < Spotify::Track::Base
      private

      def track_data
        muffon_data
          .merge(track_base_data)
          .merge(track_extra_data)
          .merge(with_more_data)
      end

      def track_base_data
        {
          source: source_data,
          player_id:,
          title:,
          artist: artist_names_data,
          artists:
        }
      end

      def track_extra_data
        {
          album: album_data,
          image: image_data,
          profiles_count:,
          duration:,
          duration_seconds:,
          audio: audio_data
        }.compact
      end

      def audio_data
        {
          present: audio_link.present?,
          link: audio_link
        }
      end

      def audio_link
        return unless audio_present?
        return 'test.mp3' if test?

        @audio_link ||=
          Spotify::Utils::Audio::Link.call(
            track_id: @args[:track_id]
          )
      end
    end
  end
end
