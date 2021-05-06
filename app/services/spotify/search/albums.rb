module Spotify
  module Search
    class Albums < Spotify::Search::Base
      private

      def collection_name
        'albums'
      end

      def albums
        results.map do |a|
          {
            title: a['name'],
            artists: artists(a),
            image: a.dig('images', 0, 'url'),
            released: a['release_date'],
            spotify_id: a['id']
          }
        end
      end

      def artists(album)
        album['artists'].map do |a|
          {
            name: a['name'],
            spotify_id: a['id']
          }
        end
      end
    end
  end
end
