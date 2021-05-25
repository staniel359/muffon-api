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
            title: title,
            genius_id: genius_id,
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
