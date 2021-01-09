module Bandcamp
  module Album
    class Tags < Bandcamp::Album::Base
      private

      def album_data
        {
          title: track_title,
          artist: artist_name,
          tags: tags
        }
      end
    end
  end
end
