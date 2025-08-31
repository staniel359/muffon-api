module Bandcamp
  module Search
    class Artists
      class Artist < Bandcamp::Search::Artists
        include Bandcamp::Utils::Artist

        def call
          check_args

          data
        end

        private

        def required_args
          %i[
            artist
          ]
        end

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

        def image
          artist['img']
        end

        alias model artist
      end
    end
  end
end
