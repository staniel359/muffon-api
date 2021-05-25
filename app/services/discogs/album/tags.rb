module Discogs
  module Album
    class Tags < Discogs::Album::Base
      private

      def album_data
        { tags: tags }
      end
    end
  end
end
