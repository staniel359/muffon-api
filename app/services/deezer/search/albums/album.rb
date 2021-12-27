module Deezer
  module Search
    class Albums
      class Album < Deezer::Search::Albums
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
            source_id: SOURCE_ID,
            deezer_id: deezer_id,
            title: title,
            artists: artists,
            image: image_data
          }.compact
        end

        def album
          @args[:album]
        end
      end
    end
  end
end
