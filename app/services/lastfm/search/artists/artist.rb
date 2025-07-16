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
          self_data
            .merge(artist_data)
        end

        def artist
          @args[:artist]
        end

        def artist_data
          {
            source: source_data,
            name:,
            image: image_data,
            listeners_count:
          }.compact
        end

        def listeners_count
          artist['listeners'].to_i
        end
      end
    end
  end
end
