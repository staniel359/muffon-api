module Spotify
  module Search
    class Artists
      class Artist < Spotify::Search::Artists
        include Muffon::Utils::Artist

        def call
          data
        end

        private

        def data
          muffon_data
            .merge(artist_data)
        end

        def artist_data
          {
            spotify_id: spotify_id,
            name: name,
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
