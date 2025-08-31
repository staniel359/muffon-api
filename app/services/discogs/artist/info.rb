module Discogs
  module Artist
    class Info < Discogs::Artist::Base
      private

      def name
        artist['name']
      end

      def link
        "#{super}/#{@args[:artist_id]}"
      end
    end
  end
end
