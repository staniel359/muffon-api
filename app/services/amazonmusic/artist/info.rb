module AmazonMusic
  module Artist
    class Info < AmazonMusic::Artist::Base
      private

      def link
        "#{BASE_LINK}/showCatalogArtist"
      end

      def no_data?
        name.blank?
      end

      def name
        response_data.dig(
          'methods', 0, 'template',
          'headerText', 'text'
        )
      end

      def payload
        AmazonMusic::Utils::Request::Payload.call(
          model_id: artist_id
        )
      end
    end
  end
end
