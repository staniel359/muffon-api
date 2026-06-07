module Deezer
  module Mixins
    module Track
      include Muffon::Mixins::Formatting::Collection

      private

      def title
        title_with_extra_title(
          raw_title,
          extra_title:
        )
      end

      def raw_title
        raw_track_data['SNG_TITLE']
      end

      def extra_title
        return if raw_track_data['VERSION'].blank?

        extra = raw_track_data['VERSION']

        extra = extra[1..] if extra.start_with?('(')

        extra = extra[0..-2] if extra.end_with?(')')

        extra
      end

      def raw_artists
        raw_track_data['ARTISTS'].map do |raw_artist_data|
          {
            name: raw_artist_data['ART_NAME'],
            source_id: raw_artist_data['ART_ID'].to_i
          }
        end
      end

      def deezer_id
        raw_track_data['SNG_ID'].to_i
      end

      def source_original_link
        "https://www.deezer.com/track/#{deezer_id}"
      end

      def album_title
        raw_track_data['ALB_TITLE']
      end

      def album_deezer_id
        raw_track_data['ALB_ID'].to_i
      end

      def image_data
        Deezer::Formatter::Image.call(
          image_id:,
          model: 'track'
        )
      end

      def image_id
        raw_track_data['ALB_PICTURE']
      end

      def duration
        raw_track_data['DURATION'].to_i
      end

      def audio_present?
        raw_track_data['FILESIZE'].to_i.positive?
      end

      def audio_link
        return if @args[:with_audio].blank?

        Deezer::Utils::Track::Audio::Link.call(
          track_id: @args[:track_id]
        )
      end

      def release_date
        Muffon::Formatter::Date.call(
          date: raw_release_date
        )
      end

      def raw_release_date
        raw_track_data['DIGITAL_RELEASE_DATE']
      end
    end
  end
end
