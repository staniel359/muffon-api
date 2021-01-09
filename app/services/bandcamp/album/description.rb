module Bandcamp
  module Album
    class Description < Bandcamp::Album::Base
      private

      def album_data
        {
          title: base_data['name'],
          artist: base_data.dig('byArtist', 'name'),
          description: description
        }
      end
    end
  end
end
