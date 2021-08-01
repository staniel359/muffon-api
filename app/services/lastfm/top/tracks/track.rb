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
          {
            library_id: library_id,
            title: title,
            player_id: player_id,
            artist: artist_formatted,
            artists: artists,
            listeners_count: listeners_count
          }.compact
        end

        def track
          @track ||= @args.track
        end
      end
    end
  end
end
