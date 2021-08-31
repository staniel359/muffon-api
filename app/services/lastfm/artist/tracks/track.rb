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
          muffon_data.merge(track_data)
        end

        def track_data
          {
            title: title,
            player_id: player_id,
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
