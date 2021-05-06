module Spotify
  module Track
    class Info < Spotify::Base
      private

      def primary_args
        [@args.track_id]
      end

      def no_data?
        response_data.blank?
      end

      def link
        "https://api.spotify.com/v1/tracks/#{@args.track_id}"
      end

      def data
        { track: track_data }
      end

      def track_data
        {
          title: response_data['name'],
          artists: artists(response_data),
          length: response_data['duration_ms'].fdiv(1000).ceil,
          albums: albums
        }
      end

      def artists(model)
        model['artists'].map do |a|
          {
            name: a['name'],
            spotify_id: a['id']
          }
        end
      end

      def albums
        [response_data['album']].map do |a|
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
