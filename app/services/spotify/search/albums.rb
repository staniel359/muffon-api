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

      def collection_data
        results.map do |a|
          {
            title: a['name'],
            artist: artist_name(a),
            images: images(a, 'album'),
            released: time_formatted(a['release_date']),
            spotify_id: a['id']
          }
        end
      end
    end
  end
end
