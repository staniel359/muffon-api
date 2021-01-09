module Bandcamp
  module Album
    class Description < Bandcamp::Album::Base
      private

      def album_data
        {
          title: track_title,
          artist: artist_name,
          description: description
        }
      end
    end
  end
end
