module Discogs
  module Artist
    class Base < Discogs::Base
      private

      def response_data
        @response_data ||=
          Nokogiri::HTML.parse(
            response
          )
      end

      def link
        'https://www.discogs.com' \
          "/artist/#{@args[:artist_id]}"
      end

      def data
        { artist: artist_data }
      end

      def artist_data
        { name: }
      end
    end
  end
end
