module Deezer
  module Track
    class Info < Deezer::Track::Base
      private

      def track_data
        self_data
          .merge(track_base_data)
          .merge(track_extra_data)
      end

      def track_base_data
        {
          source: source_data,
          player_id: player_source_id,
          title:,
          artist: artists_base_data,
          artists:
        }.compact
      end

      def track_extra_data
        {
          album: album_data,
          image: image_data,
          profiles_count:,
          duration:,
          release_date:,
          audio: audio_base_data
        }.compact
      end

      def release_date
        date_formatted(
          track['DIGITAL_RELEASE_DATE']
        )
      end

      def audio_link
        audio_full_link ||
          audio_preview_link
      end

      def audio_full_link
        Deezer::Utils::Audio::Link.call(
          track_id: @args[:track_id]
        )
      end

      def audio_preview_link
        audio_preview_data.try(
          :[], 'HREF'
        )
      end

      def audio_preview_data
        track['MEDIA'].find do |m|
          m['TYPE'] == 'preview'
        end
      end
    end
  end
end
