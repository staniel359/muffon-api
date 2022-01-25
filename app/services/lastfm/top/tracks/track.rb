module LastFM
  module Top
    class Tracks
      class Track < LastFM::Top::Tracks
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
            player_id:,
            source_id: SOURCE_ID,
            title:,
            artists:,
            listeners_count:
          }
        end

        def track
          @args[:track]
        end
      end
    end
  end
end
