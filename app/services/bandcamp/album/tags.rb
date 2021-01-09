module Bandcamp
  module Album
    class Tags < Bandcamp::Album::Base
      private

      def album_data
        {
          title: base_data['name'],
          artist: base_data.dig('byArtist', 'name'),
          tags: tags
        }
      end
    end
  end
end
