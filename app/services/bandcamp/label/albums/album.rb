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
          self_data
            .merge(album_base_data)
            .merge(album_extra_data)
        end

        def album
          @args[:album]
        end

        def album_base_data
          {
            source: source_data,
            title:,
            artist: artist_names_data,
            artists:
          }
        end

        def album_extra_data
          {
            image: image_data,
            release_date:
          }.compact
        end
      end
    end
  end
end
