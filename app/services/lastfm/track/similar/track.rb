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
