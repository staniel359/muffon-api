module LastFM
  module Track
    class Similar
      class Track < LastFM::Track::Similar
        include LastFM::Utils::Track

        def call
          data
        end

        private

        def data
          muffon_data
            .merge(track_data)
        end

        def track_data
          {
            player_id: player_id,
            title: title,
            artists: artists,
            duration: duration,
            duration_seconds: duration_seconds
          }
        end

        def track
          @args[:track]
        end
      end
    end
  end
end
