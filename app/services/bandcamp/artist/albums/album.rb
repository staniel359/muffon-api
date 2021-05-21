module Bandcamp
  module Artist
    class Albums
      class Album < Bandcamp::Artist::Albums
        include Bandcamp::Utils::Album

        def call
          data
        end

        private

        def data
          {
            title: title,
            bandcamp_id: bandcamp_id,
            bandcamp_model: bandcamp_model,
            image: image_data,
            release_date: release_date
          }
        end

        def album
          @album ||= @args.album
        end
      end
    end
  end
end
