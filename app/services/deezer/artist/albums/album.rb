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

        def album_data
          {
            source_id:,
            deezer_id:,
            title:,
            image: image_data,
            release_date:,
            listeners_count:
          }.compact
        end

        def album
          @args[:album]
        end
      end
    end
  end
end
