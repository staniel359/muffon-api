module SoundCloud
  module Search
    class Artists
      class Artist < SoundCloud::Search::Artists
        include SoundCloud::Utils::Artist

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
      end
    end
  end
end
