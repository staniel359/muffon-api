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
          id: id,
          player_id: player_id,
          title: title,
          extra_title: extra_title,
          artist: artist_formatted,
          artists: artists
        }.compact
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
          present: audio_link.present?,
          link: audio_link,
          source_id: SOURCE_ID
        }
      end

      def audio_link
        @audio_link ||= Deezer::Utils::Audio::File.call(
          track_id: deezer_id
        )
      end
    end
  end
end
