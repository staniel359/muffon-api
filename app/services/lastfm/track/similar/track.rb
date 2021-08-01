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
          {
            library_id: library_id,
            title: title,
            player_id: player_id,
            artist: artist_formatted,
            artists: artists,
            duration: duration
          }.compact
        end

        def track
          @track ||= @args.track
        end
      end
    end
  end
end
