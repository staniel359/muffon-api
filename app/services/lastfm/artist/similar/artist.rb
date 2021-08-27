module LastFM
  module Artist
    class Similar
      class Artist < LastFM::Artist::Similar
        prepend LastFM::Utils::Artist

        def call
          data
        end

        private

        def data
          return minimal_data if @args.minimal

          {
            library_id: library_id,
            name: name,
            image: image_data,
            listeners_count: listeners_count
          }.compact
        end

        def minimal_data
          { name: name }
        end

        def artist
          @artist ||= @args.artist
        end
      end
    end
  end
end
