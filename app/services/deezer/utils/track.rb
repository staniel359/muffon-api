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

      def artist_name
        artist_names
      end

      def artists_list
        track['ARTISTS']
      end

      def albums
        @albums ||= [
          album_data_formatted
        ].presence
      end

      def album_data_formatted
        return if track['ALB_TITLE'].blank?

        {
          source_id: self.class::SOURCE_ID,
          deezer_id: track['ALB_ID'].to_i,
          title: track['ALB_TITLE']
        }
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
          present: audio_file_present?,
          track_id: deezer_id,
          source_id: self.class::SOURCE_ID
        }
      end

      def audio_file_present?
        track['FILESIZE'].to_i.positive?
      end
    end
  end
end
