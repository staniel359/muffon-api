module Deezer
  module Artist
    class Albums
      class Album < Deezer::Artist::Albums
        include Deezer::Utils::Album

        def call
          data
        end

        private

        def data
          muffon_data
            .merge(album_data)
        end

        def album
          @args[:album]
        end

        def album_data
          album_base_data
            .merge(album_extra_data)
        end

        def album_base_data
          {
            source: source_data,
            title:,
            artist: artist_names_data,
            artists:
          }.compact
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
