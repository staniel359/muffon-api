module Spotify
  module Search
    class Albums < Spotify::Search::Base
      private

      def collection_name
        'albums'
      end

      def collection_type
        'album'
      end

      def collection_item_data(album)
        {
          title: album['name'],
          artist: artist_data(album),
          image: image_data(album, 'album'),
          released: date_formatted(album['release_date']),
          spotify_id: album['id']
        }
      end
    end
  end
end
