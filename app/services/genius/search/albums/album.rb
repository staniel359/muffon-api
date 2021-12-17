module Genius
  module Search
    class Albums
      class Album < Genius::Search::Albums
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
            genius_id: genius_id,
            title: title,
            artist: artist_formatted,
            artists: artists,
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
