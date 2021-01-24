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

      def collection_item_data(artist)
        {
          name: artist['name'],
          image: images_data(artist, 'artist'),
          spotify_id: artist['id']
        }
      end
    end
  end
end
