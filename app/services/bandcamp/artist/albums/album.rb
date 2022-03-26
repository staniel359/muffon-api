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
          muffon_data
            .merge(album_base_data)
            .merge(album_extra_data)
        end

        def album_base_data
          {
            source_id: SOURCE_ID,
            bandcamp_id:,
            bandcamp_model:,
            title:,
            artists:
          }
        end

        def album
          @args[:album]
        end

        def album_extra_data
          {
            image: image_data,
            release_date:,
            listeners_count:
          }.compact
        end
      end
    end
  end
end
