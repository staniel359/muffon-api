module AmazonMusic
  module Album
    class Base < AmazonMusic::Base
      include AmazonMusic::Utils::Album

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
        album['header'] == 'Service error'
      end

      def album
        @album ||=
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
        AmazonMusic::Utils::Request::Payload.call(
          model_id: album_id
        )
      end

      def album_id
        @args[:album_id]
      end

      def data
        { album: album_data }
      end

      def tracks_list
        album.dig(
          'widgets',
          0,
          'items'
        )
      end

      alias response post_response
    end
  end
end
