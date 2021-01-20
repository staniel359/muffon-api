module Spotify
  module Artist
    class Similar < Spotify::Artist::Base
      private

      def results
        response_data['artists']
      end

      def link
        "#{artist_base_link}/related-artists"
      end

      def data
        { artist: artist_data }
      end

      def artist_data
        { similar: similar_data }
      end

      def similar_data
        results.map do |a|
          {
            name: a['name'],
            images: images(a, 'artist'),
            spotify_id: a['id']
          }
        end
      end
    end
  end
end
