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
            image: image_data,
            listeners_count: listeners_count
          }.compact
        end

        def artist
          @artist ||= @args.artist
        end
      end
    end
  end
end
