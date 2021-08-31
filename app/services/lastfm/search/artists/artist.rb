module LastFM
  module Search
    class Artists
      class Artist < LastFM::Search::Artists
        include LastFM::Utils::Artist

        def call
          data
        end

        private

        def data
          muffon_data.merge(artist_data)
        end

        def artist_data
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
