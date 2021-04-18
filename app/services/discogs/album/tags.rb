module Discogs
  module Album
    class Tags < Discogs::Album::Base
      private

      def album_data
        {
          title: title,
          artist: artist_data(response_data),
          tags: tags
        }
      end
    end
  end
end
