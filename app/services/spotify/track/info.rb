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
        "#{base_link}/tracks/#{@args.track_id}"
      end

      def data
        { track: track_data }
      end

      def track_data
        {
          title: response_data['name'],
          artist: artist_name(response_data),
          album: album_data,
          length: length(response_data),
          audio: audio_data(response_data)
        }
      end

      def album_data
        {
          title: album['name'],
          artist: artist_name(album),
          images: images(album, 'album'),
          released: time_formatted(album['release_date']),
          spotify_id: album['id']
        }
      end

      def album
        response_data['album']
      end
    end
  end
end
