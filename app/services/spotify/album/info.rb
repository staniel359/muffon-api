module Spotify
  module Album
    class Info < Spotify::Base
      private

      def primary_args
        [@args.album_id]
      end

      def no_data?
        response_data.blank?
      end

      def link
        "https://api.spotify.com/v1/albums/#{@args.album_id}"
      end

      def data
        { album: album_data }
      end

      def album_data
        {
          title: response_data['name'],
          artists: artists,
          image: response_data.dig('images', 0, 'url'),
          released: time_formatted(response_data['release_date']),
          label: response_data['label'],
          genres: response_data['genres'],
          tracks: tracks
        }
      end

      def artists
        response_data['artists'].map do |a|
          {
            name: a['name'],
            spotify_id: a['id']
          }
        end
      end

      def tracks
        response_data.dig('tracks', 'items').map do |t|
          {
            title: t['name'],
            length: t['duration_ms'].fdiv(1000).ceil,
            spotify_id: t['id']
          }
        end
      end
    end
  end
end
