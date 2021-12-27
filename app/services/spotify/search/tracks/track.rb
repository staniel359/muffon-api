module Spotify
  module Search
    class Tracks
      class Track < Spotify::Search::Tracks
        include Spotify::Utils::Track

        def call
          data
        end

        private

        def data
          muffon_data
            .merge(track_base_data)
            .merge(track_extra_data)
        end

        def track_base_data
          {
            player_id: player_id,
            source_id: SOURCE_ID,
            spotify_id: spotify_id,
            title: title,
            artists: artists
          }
        end

        def track
          @args[:track]
        end

        def track_extra_data
          {
            album: album_data,
            image: image_data,
            duration: duration,
            duration_seconds: duration_seconds,
            audio: audio_data
          }.compact
        end
      end
    end
  end
end
