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
            id: id,
            source_id: SOURCE_ID,
            deezer_id: deezer_id,
            title: title,
            artist: artist_formatted,
            artists: artists,
            image: image_data
          }
        end

        def album
          @album ||= @args.album
        end
      end
    end
  end
end
