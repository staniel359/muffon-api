module LastFM
  module Album
    class Info
      class Track < LastFM::Album::Info
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
            source_id:,
            player_id:,
            title:,
            artist: artist_names_data,
            artists:,
            duration:,
            duration_seconds:
          }
        end

        def track
          @args[:track]
        end
      end
    end
  end
end
