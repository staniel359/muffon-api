module AmazonMusic
  module Artist
    class Info < AmazonMusic::Artist::Base
      private

      def name
        response_data.dig(
          'methods',
          0,
          'template',
          'headerText',
          'text'
        )
      end

      def request_url
        "#{REQUEST_BASE_URL}/showCatalogArtist"
      end

      def request_payload
        AmazonMusic::Formatter::Request::Payload.call(
          model_id: @args[:artist_id]
        )
      end
    end
  end
end
