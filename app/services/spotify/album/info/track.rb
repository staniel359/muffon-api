module Spotify
  module Album
    class Info
      class Track < Spotify::Album::Info
        include Spotify::Utils::Track

        def call
          data
        end

        private

        def data
          muffon_data.merge(track_data)
        end

        def track_data
          {
            title: title,
            spotify_id: spotify_id,
            player_id: player_id,
            artist: artist_formatted,
            artists: artists,
            duration: duration,
            audio: audio_data
          }
        end

        def track
          @track ||= @args.track
        end
      end
    end
  end
end
