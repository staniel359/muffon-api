module Deezer
  module Track
    class Info < Deezer::Track::Base
      private

      def track_data
        muffon_data
          .merge(track_base_data)
          .merge(track_extra_data)
      end

      def track_base_data
        {
          source: source_data,
          player_id:,
          title:,
          extra_title:,
          artist: artist_names_data,
          artists:
        }.compact
      end

      def track_extra_data
        {
          album: album_data,
          image: image_data,
          profiles_count:,
          duration:,
          duration_seconds:,
          release_date:,
          audio: audio_data
        }.compact
      end

      def release_date
        date_formatted(
          track['DIGITAL_RELEASE_DATE']
        )
      end

      def audio_data
        {
          present: audio_link.present?,
          link: audio_link
        }
      end

      def audio_link
        @audio_link ||=
          Deezer::Utils::Audio::File.call(
            track_id: @args[:track_id]
          )
      end
    end
  end
end
