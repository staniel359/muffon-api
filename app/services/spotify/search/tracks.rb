module Spotify
  module Search
    class Tracks < Spotify::Search::Base
      private

      def collection_name
        'tracks'
      end

      def tracks
        results.map do |t|
          {
            title: t['name'],
            artists: artists(t),
            length: t['duration_ms'].fdiv(1000).ceil,
            albums: albums(t),
            spotify_id: t['id']
          }
        end
      end

      def artists(model)
        model['artists'].map do |a|
          {
            name: a['name'],
            spotify_id: a['id']
          }
        end
      end

      def albums(track)
        [track['album']].map do |a|
          {
            title: a['name'],
            artists: artists(a),
            image: a.dig('images', 0, 'url'),
            released: a['release_date'],
            spotify_id: a['id']
          }
        end
      end
    end
  end
end
