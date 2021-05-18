module Genius
  module Album
    class Description < Genius::Album::Base
      private

      def album_data
        {
          title: title,
          artist: artist_data,
          description: description
        }
      end
    end
  end
end