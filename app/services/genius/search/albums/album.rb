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
          {
            id: id,
            genius_id: genius_id,
            title: title,
            artist: artist_formatted,
            artists: artists,
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
