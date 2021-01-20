module Spotify
  module Search
    class Artists < Spotify::Search::Base
      private

      def collection_name
        'artists'
      end

      def collection_type
        'artist'
      end

      def collection_data
        results.map do |a|
          {
            name: a['name'],
            image: images(a, 'artist'),
            spotify_id: a['id']
          }
        end
      end
    end
  end
end
