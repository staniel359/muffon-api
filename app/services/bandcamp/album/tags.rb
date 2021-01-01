module Bandcamp
  module Album
    class Tags < Bandcamp::Base
      private

      def data
        { album: album_data }
      end

      def album_data
        {
          title: base_data['name'],
          artist: base_data.dig('byArtist', 'name'),
          tags: base_data['keywords'].split(', ')
        }
      end
    end
  end
end
