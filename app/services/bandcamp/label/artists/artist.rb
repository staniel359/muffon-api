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
            name: name,
            bandcamp_id: bandcamp_id,
            bandcamp_model: 'artist',
            image: image_data
          }
        end

        def name
          @args.artist['name']
        end

        def bandcamp_id
          @args.artist['id']
        end

        def image_data
          image_data_formatted(
            image, 'artist'
          )
        end

        def image
          'https://f4.bcbits.com/img'\
            "/00#{image_id}_10.jpg"
        end

        def image_id
          @args.artist['image_id']
        end
      end
    end
  end
end
