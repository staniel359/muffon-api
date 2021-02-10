module Bandcamp
  module Album
    class Description < Bandcamp::Album::Base
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
