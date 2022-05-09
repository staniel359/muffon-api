module Deezer
  module Utils
    module Track
      include Muffon::Utils::Track

      private

      def title
        track['SNG_TITLE']
      end

      def extra_title
        return if track['VERSION'].blank?

        extra = track['VERSION']
        extra = extra[1..] if extra.start_with?('(')
        extra = extra[0..-2] if extra.end_with?(')')

        extra
      end

      def deezer_id
        track['SNG_ID'].to_i
      end

      def artists_list
        track['ARTISTS']
      end

      def album_data
        return if album_title.blank?

        {
          source_id:,
          deezer_id: album_deezer_id,
          title: album_title
        }
      end

      def album_title
        track['ALB_TITLE']
      end

      def album_deezer_id
        track['ALB_ID'].to_i
      end

      def image_data
        image_data_formatted(
          track['ALB_PICTURE'], 'track'
        )
      end

      def duration_seconds
        track['DURATION'].to_i
      end

      def audio_data
        {
          source_id:,
          present: audio_file_present?,
          track_id: deezer_id
        }
      end

      def audio_file_present?
        track['FILESIZE'].to_i.positive?
      end
    end
  end
end
