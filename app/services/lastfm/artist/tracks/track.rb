module LastFM
  module Artist
    class Tracks
      class Track < LastFM::Artist::Tracks
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
            source_id: SOURCE_ID,
            title: title,
            listeners_count: listeners_count
          }
        end

        def track
          @args[:track]
        end
      end
    end
  end
end
