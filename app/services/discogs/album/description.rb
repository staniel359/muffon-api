module Discogs
  module Album
    class Description < Discogs::Album::Base
      private

      def album_data
        {
          title: response_data['title'],
          artist: artist_data,
          description: description
        }
      end
    end
  end
end
