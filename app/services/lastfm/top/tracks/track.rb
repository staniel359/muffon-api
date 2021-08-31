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
          muffon_data.merge(track_data)
        end

        def track_data
          {
            title: title,
            player_id: player_id,
            artist: artist_formatted,
            artists: artists,
            listeners_count: listeners_count
          }
        end

        def track
          @track ||= @args.track
        end
      end
    end
  end
end
