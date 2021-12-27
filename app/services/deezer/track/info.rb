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
          player_id: player_id,
          source_id: SOURCE_ID,
          deezer_id: deezer_id,
          title: title,
          extra_title: extra_title,
          artists: artists
        }.compact
      end

      def track_extra_data
        {
          album: album_data,
          image: image_data,
          duration: duration,
          duration_seconds: duration_seconds,
          release_date: release_date,
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
          link: audio_link,
          source_id: SOURCE_ID
        }
      end

      def audio_link
        @audio_link ||=
          Deezer::Utils::Audio::File.call(
            track_id: deezer_id
          )
      end
    end
  end
end
