module AmazonMusic
  module Artist
    class Info < AmazonMusic::Artist::Base
      private

      def name
        artist.dig(
          'methods',
          0,
          'template',
          'headerText',
          'text'
        )
      end

      def link
        "#{BASE_LINK}/showCatalogArtist"
      end

      def payload
        AmazonMusic::Utils::Request::Payload.call(
          model_id: @args[:artist_id]
        )
      end
    end
  end
end
