module Deezer
  module Utils
    module Track
      include Muffon::Utils::Track

      private

      def source_data
        {
          name: source_name,
          id: track['SNG_ID'].to_i
        }
      end

      def title
        title_formatted(
          raw_title,
          extra_title
        )
      end

      def raw_title
        track['SNG_TITLE']
      end

      def extra_title
        return if track['VERSION'].blank?

        extra = track['VERSION']
        extra = extra[1..] if extra.start_with?('(')
        extra = extra[0..-2] if extra.end_with?(')')

        extra
      end

      def artists_list
        track['ARTISTS']
      end

      def album_data
        return if album_title.blank?

        {
          source: album_source_data,
          title: album_title
        }
      end

      def album_title
        track['ALB_TITLE']
      end

      def album_source_data
        {
          name: source_name,
          id: track['ALB_ID'].to_i
        }
      end

      def image_data
        image_data_formatted(
          track['ALB_PICTURE'],
          'track'
        )
      end

      def duration
        track['DURATION'].to_i
      end

      def audio_data
        { present: audio_present? }
      end

      def audio_present?
        track['FILESIZE'].to_i.positive?
      end
    end
  end
end
