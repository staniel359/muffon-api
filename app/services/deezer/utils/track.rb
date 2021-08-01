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

        track['VERSION'].match(
          /\((.+)\)/
        )[1]
      end

      def deezer_id
        track['SNG_ID'].to_i
      end

      def artists_list
        track['ARTISTS']
      end

      def albums
        @albums ||= [album_data_formatted(track)]
      end

      def image_data
        image_data_formatted(
          track['ALB_PICTURE'], 'track'
        )
      end

      def duration
        duration_formatted(
          track['DURATION']
        )
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
