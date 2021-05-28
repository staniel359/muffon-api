module Spotify
  module Search
    class Albums
      class Album < Spotify::Search::Albums
        include Spotify::Utils::Album

        def call
          data
        end

        private

        def data
          {
            title: title,
            spotify_id: spotify_id,
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
