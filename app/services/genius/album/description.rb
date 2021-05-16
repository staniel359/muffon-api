module Genius
  module Album
    class Description < Genius::Album::Base
      private

      def album_data
        {
          title: album['name'],
          genius_id: album['id'],
          artist: artist_data,
          description: description
        }
      end
    end
  end
end
