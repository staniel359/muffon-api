module Bandcamp
  module Label
    class Artists
      class Artist < Bandcamp::Label::Artists
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
            image: image_data
          }.compact
        end
      end
    end
  end
end
