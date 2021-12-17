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
          }.compact
        end

        def name
          artist['name']
        end

        def artist
          @args[:artist]
        end

        def spotify_id
          artist['id']
        end

        def image_data
          image_data_formatted(
            artist, 'artist'
          )
        end
      end
    end
  end
end
