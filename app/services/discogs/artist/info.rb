module Discogs
  module Artist
    class Info < Discogs::Artist::Base
      private

      def name
        raw_artist_data['name']
      end

      def request_url
        "#{REQUEST_BASE_URL}/#{@args[:artist_id]}"
      end
    end
  end
end
