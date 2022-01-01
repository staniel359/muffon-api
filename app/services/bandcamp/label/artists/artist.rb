module Bandcamp
  module Label
    class Artists
      class Artist < Bandcamp::Label::Artists
        def call
          data
        end

        private

        def data
          {
            name:,
            bandcamp_id:,
            bandcamp_model: 'artist',
            image: image_data
          }.compact
        end

        def name
          artist['name']
        end

        def artist
          @args[:artist]
        end

        def bandcamp_id
          artist['id']
        end

        def image_data
          image_data_formatted(
            image
          )
        end

        def image
          'https://f4.bcbits.com/img'\
            "/00#{image_id}_10.jpg"
        end

        def image_id
          artist['image_id']
        end
      end
    end
  end
end
