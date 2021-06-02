module Deezer
  module Track
    class Info < Deezer::Track::Base
      private

      def track_data
        track_base_data
          .merge(track_extra_data)
      end

      def track_base_data
        {
          title: title,
          deezer_id: deezer_id,
          player_id: player_id,
          artist: artist_formatted,
          artists: artists
        }
      end

      def track_extra_data
        {
          album: album_formatted,
          albums: albums,
          image: image_data,
          duration: duration,
          release_date: release_date,
          audio: audio_data
        }
      end

      def release_date
        date_formatted(
          track['DIGITAL_RELEASE_DATE']
        )
      end

      def audio_data
        {
          present: audio_path.present?,
          link: audio_link,
          source_id: SOURCE_ID
        }
      end

      def audio_path
        @audio_path ||= Deezer::Utils::Audio::Decoder.call(
          track_id: deezer_id
        )
      end

      def audio_link
        return '' if audio_path.blank?

        "#{secrets[:files_url]}/#{audio_path}"
      end
    end
  end
end
