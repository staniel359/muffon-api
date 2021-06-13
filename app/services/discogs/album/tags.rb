module Discogs
  module Album
    class Tags < Discogs::Album::Info
      private

      def album_data
        { tags: tags }
      end
    end
  end
end
