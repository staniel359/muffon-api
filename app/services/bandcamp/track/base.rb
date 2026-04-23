module Bandcamp
  module Track
    class Base < Bandcamp::Base
      include Bandcamp::Mixins::Track

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
        raw_track_data.blank?
      end

      def raw_track_data
        response_data.dig(
          'tracks',
          0
        )
      end

      def link
        "#{BASE_LINK}/tralbum_details"
      end

      def params
        {
          band_id: @args[:artist_id],
          tralbum_id: @args[:track_id],
          tralbum_type: bandcamp_album_type
        }
      end

      def bandcamp_album_type
        MODELS_TYPES_DATA['track']
      end

      def data
        { track: track_data }
      end
    end
  end
end
