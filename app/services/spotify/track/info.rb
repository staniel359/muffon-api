module Spotify
  module Track
    class Info < Spotify::Track::Base
      private

      def track_data
        track_base_data
          .merge(track_extra_data)
          .merge(with_more_data)
      end

      def track_base_data
        {
          title: title,
          spotify_id: spotify_id,
          player_id: player_id,
          artist: artist_formatted,
          artists: artists
        }
      end

      def track_extra_data
        {
          album: album_formatted,
          albums: albums,
          image: image_data,
          duration: duration,
          audio: audio_data
        }
      end
    end
  end
end
