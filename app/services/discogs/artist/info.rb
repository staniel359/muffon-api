module Discogs
  module Artist
    class Info < Discogs::Artist::Base
      private

      def primary_args
        [@args[:artist_id]]
      end

      def link
        "#{super}/#{@args[:artist_id]}"
      end

      def name
        response_data['name']
      end
    end
  end
end
