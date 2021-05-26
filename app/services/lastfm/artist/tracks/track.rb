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
          {
            title: title,
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
