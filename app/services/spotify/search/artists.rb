module Spotify
  module Search
    class Artists < Spotify::Search::Base
      private

      def collection_name
        'artists'
      end

      def artists
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
