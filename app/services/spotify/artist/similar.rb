module Spotify
  module Artist
    class Similar < Spotify::Artist::Base
      private

      def results
        response_data['artists']
      end

      def link
        "#{base_link}/related-artists"
      end

      def base_params
        {}
      end

      def data
        { artist: { similar: similar } }
      end

      def similar
        results.map do |a|
          {
            name: a['name'],
            image: a.dig('images', 0, 'url'),
            spotify_id: a['id']
          }
        end
      end
    end
  end
end
