module Discogs
  module Album
    class Description < Discogs::Album::Base
      private

      def album_data
        {
          title: title,
          artist: artist_data(response_data),
          description: description
        }
      end
    end
  end
end
