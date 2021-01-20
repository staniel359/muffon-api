module Spotify
  module Artist
    class TopTracks < Spotify::Artist::Base
      private

      def results
        response_data['tracks']
      end

      def link
        "#{artist_base_link}/top-tracks"
      end

      def params
        { country: 'US' }
      end

      def data
        { artist: artist_data }
      end

      def artist_data
        { tracks: tracks_data }
      end

      def tracks_data
        results.map do |t|
          {
            title: t['name'],
            album: album_data(t),
            length: length(t),
            audio: audio_data(t)
          }
        end
      end

      def album_data(track)
        {
          title: album(track)['name'],
          artist: artist_name(album(track)),
          images: images(album(track), 'album'),
          spotify_id: album(track)['id']
        }
      end

      def album(track)
        track['album']
      end
    end
  end
end
