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
            source_id:,
            genius_id:,
            title:,
            artist: artist_names_data,
            artists:,
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
