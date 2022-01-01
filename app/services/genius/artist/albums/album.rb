module Genius
  module Artist
    class Albums
      class Album < Genius::Artist::Albums
        include Genius::Utils::Album

        def call
          data
        end

        private

        def data
          muffon_data
            .merge(album_data)
        end

        def album_data
          {
            source_id: SOURCE_ID,
            genius_id:,
            title:,
            image: image_data,
            release_date:
          }.compact
        end

        def album
          @args[:album]
        end
      end
    end
  end
end
