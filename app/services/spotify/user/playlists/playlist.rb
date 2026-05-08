module Spotify
  module User
    class Playlists
      class Playlist < Spotify::Base
        include Spotify::Mixins::Playlist

        def call
          check_args

          data
        end

        private

        def required_args
          %i[
            raw_playlist_data
          ]
        end

        def data
          Muffon::Formatter::Source::Playlists::Playlist.call(
            source_original_link:,
            source_name:,
            source_playlist_id: spotify_id,
            title:,
            description:,
            image_data:,
            tracks_count:
          )
        end

        def raw_playlist_data
          @args[:raw_playlist_data]
        end

        def tracks_count
          raw_playlist_data.dig(
            'items',
            'total'
          )
        end

        def images
          raw_playlist_data['images']
        end
      end
    end
  end
end
