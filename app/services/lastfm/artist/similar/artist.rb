module LastFM
  module Artist
    class Similar
      class Artist < LastFM::Artist::Similar
        include LastFM::Utils::Artist

        def call
          data
        end

        private

        def data
          {
            name: name,
            image: image_data
          }.compact
        end

        def artist
          @artist ||= @args.artist
        end
      end
    end
  end
end
