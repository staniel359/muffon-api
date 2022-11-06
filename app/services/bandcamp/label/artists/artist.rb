module Bandcamp
  module Label
    class Artists
      class Artist < Bandcamp::Label::Artists
        include Bandcamp::Utils::Artist

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
            image: image_data
          }.compact
        end
      end
    end
  end
end
