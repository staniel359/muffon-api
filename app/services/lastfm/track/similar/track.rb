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
          self_data
            .merge(track_data)
        end

        def track
          @args[:track]
        end

        def track_data
          {
            source: source_data,
            player_id:,
            title:,
            artist: artists_base_data,
            artists:,
            duration:
          }
        end
      end
    end
  end
end
