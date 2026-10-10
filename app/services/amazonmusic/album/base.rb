module AmazonMusic
  module Album
    class Base < AmazonMusic::Base
      include AmazonMusic::Mixins::Album

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

      def not_found?
        raw_album_data.blank?
      end

      def raw_album_data
        response_data.dig(
          'data',
          'album'
        )
      end

      def data
        { album: album_data }
      end
    end
  end
end
