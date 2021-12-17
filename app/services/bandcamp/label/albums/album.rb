module Bandcamp
  module Label
    class Albums
      class Album < Bandcamp::Label::Albums
        include Bandcamp::Utils::Album

        def call
          data
        end

        private

        def data
          album_base_data
            .merge(album_extra_data)
        end

        def album_base_data
          {
            source_id: SOURCE_ID,
            bandcamp_id: bandcamp_id,
            bandcamp_model: bandcamp_model,
            title: title,
            artist: artist_formatted,
            artists: artists
          }
        end

        def album_extra_data
          {
            image: image_data,
            release_date: release_date
          }.compact
        end

        def album
          @args[:album]
        end
      end
    end
  end
end
