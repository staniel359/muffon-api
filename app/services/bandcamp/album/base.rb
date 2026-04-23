module Bandcamp
  module Album
    class Base < Bandcamp::Base
      def call
        check_args

        check_if_not_found

        data
      end

      private

      def required_args
        %i[
          artist_id
          album_id
        ]
      end

      def not_found?
        response_data['error'].present?
      end

      def link
        "#{BASE_LINK}/tralbum_details"
      end

      def params
        {
          band_id: @args[:artist_id],
          tralbum_id: @args[:album_id],
          tralbum_type: bandcamp_album_type
        }
      end

      def bandcamp_album_type
        MODELS_TYPES_DATA[
          @args[:album_type] || 'album'
        ]
      end

      def data
        { album: album_data }
      end

      alias raw_album_data response_data
    end
  end
end
