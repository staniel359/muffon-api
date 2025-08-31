module Bandcamp
  module Track
    class Base < Bandcamp::Base
      include Bandcamp::Utils::Track

      def call
        check_args

        check_if_not_found

        data
      end

      private

      def required_args
        %i[
          artist_id
          track_id
        ]
      end

      def not_found?
        track.blank? ||
          track_info_data.blank?
      end

      def track
        response_data.dig(
          'tracks', 0
        )
      end

      def params
        {
          band_id: @args[:artist_id],
          tralbum_id: @args[:track_id],
          tralbum_type: 't'
        }
      end

      def data
        { track: track_data }
      end

      alias link album_track_link
    end
  end
end
