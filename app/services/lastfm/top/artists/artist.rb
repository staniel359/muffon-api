module LastFM
  module Top
    class Artists
      class Artist < LastFM::Top::Artists
        include LastFM::Utils::Artist

        def call
          data
        end

        private

        def data
          {
            name: name,
            listeners_count: listeners_count
          }
        end

        def artist
          @artist ||= @args.artist
        end
      end
    end
  end
end
