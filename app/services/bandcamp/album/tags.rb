module Bandcamp
  module Album
    class Tags < Bandcamp::Album::Base
      private

      def album_data
        {
          title: info_data['name'],
          artist: info_data.dig('byArtist', 'name'),
          tags: info_data['keywords'].split(', ')
        }
      end
    end
  end
end
