module Discogs
  module Artist
    class Info < Discogs::Artist::Base
      private

      def name
        raw_artist_data['name']
      end

      def link
        "#{BASE_LINK}/#{@args[:artist_id]}"
      end
    end
  end
end
