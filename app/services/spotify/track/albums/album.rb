module Spotify
  module Track
    class Albums
      class Album < Spotify::Track::Albums
        include Spotify::Utils::Album

        def call
          check_args

          data
        end

        private

        def required_args
          %i[
            raw_album_data
            raw_artists
          ]
        end

        def data
          {
            **self_data,
            source: source_data,
            title:,
            artist: artists_minimal_data,
            artists:,
            image: image_data,
            release_date:,
            listeners_count:
          }.compact
        end

        def raw_album_data
          @args[:raw_album_data]
        end

        def raw_artists
          @args[:raw_artists]
        end
      end
    end
  end
end
