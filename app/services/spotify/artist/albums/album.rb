module Spotify
  module Artist
    class Albums
      class Album < Spotify::Artist::Albums
        include Spotify::Mixins::Album

        def call
          check_args

          data
        end

        private

        def required_args
          %i[
            raw_album_data
            raw_artist_data
          ]
        end

        def wrong_args?
          false
        end

        def data
          Muffon::Formatter::Artist::Albums::Album.call(
            source_original_link:,
            source_name:,
            source_album_id: spotify_id,
            title:,
            artists:,
            image_data:,
            release_date:,
            **self_args
          )
        end

        def raw_album_data
          @args[:raw_album_data].dig(
            'releases',
            'items',
            0
          )
        end

        def raw_artists
          [@args[:raw_artist_data]]
        end
      end
    end
  end
end
