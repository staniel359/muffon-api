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
          {
            id: id,
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
