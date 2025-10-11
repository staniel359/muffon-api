module LastFM
  module Track
    class Similar
      class Track < LastFM::Track::Similar
        include LastFM::Utils::Track

        def call
          check_args

          data
        end

        private

        def required_args
          %i[
            track
          ]
        end

        def data
          return track_minimal_data if @args[:minimal]

          self_data
            .merge(track_data)
        end

        def track_minimal_data
          {
            title:,
            artist:
              artists_minimal_data
          }
        end

        def track
          @args[:track]
        end

        def track_data
          {
            source: source_data,
            player_id: player_source_id,
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
