module MusixMatch
  module Album
    class Base < MusixMatch::Base
      def call
        check_args

        check_if_not_found

        data
      end

      private

      def required_args
        %i[
          album_id
        ]
      end

      def album
        response_data.dig(
          'message',
          'body',
          'album'
        )
      end

      def params
        {
          **super,
          album_id: @args[:album_id]
        }
      end

      def data
        { album: album_data }
      end
    end
  end
end
