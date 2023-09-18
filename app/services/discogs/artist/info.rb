module Discogs
  module Artist
    class Info < Discogs::Artist::Base
      private

      def link
        "#{super}/#{@args[:artist_id]}"
      end

      def name
        response_data['name']
      end
    end
  end
end
