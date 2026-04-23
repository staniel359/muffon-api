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
        raw_album_data['header'] == 'Service error'
      end

      def raw_album_data
        response_data.dig(
          'methods',
          0,
          'template'
        )
      end

      def link
        "#{BASE_LINK}/showCatalogAlbum"
      end

      def payload
        AmazonMusic::Formatter::Request::Payload.call(
          model_id: @args[:album_id]
        )
      end

      def data
        { album: album_data }
      end

      alias response post_response
    end
  end
end
