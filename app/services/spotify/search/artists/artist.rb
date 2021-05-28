module Spotify
  module Search
    class Artists
      class Artist < Spotify::Search::Artists
        def call
          data
        end

        private

        def data
          {
            name: name,
            spotify_id: spotify_id,
            image: image_data
          }
        end

        def name
          @args.artist['name']
        end

        def spotify_id
          @args.artist['id']
        end

        def image_data
          image_data_formatted(
            @args.artist, 'artist'
          )
        end
      end
    end
  end
end
