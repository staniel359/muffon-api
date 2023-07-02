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
          player_id:,
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
          present:
            audio_or_preview_link.present?,
          link:
            audio_or_preview_link
        }
      end

      def audio_or_preview_link
        return unless audio_present?
        return 'test.mp3' if test?

        @audio_or_preview_link ||=
          audio_link || audio_preview_link
      end

      def audio_link
        Deezer::Utils::Audio::File.call(
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
