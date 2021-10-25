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
          muffon_data.merge(track_data)
        end

        def track_data
          {
            id: id,
            player_id: player_id,
            title: title,
            artist: artist_formatted,
            artists: artists,
            duration: duration
          }
        end

        def track
          @track ||= @args.track
        end
      end
    end
  end
end
