module Spotify
  module Playlist
    class Tracks
      class PageTracks < Spotify::Playlist::Tracks
        def call
          check_args

          data
        end

        private

        def required_args
          %i[
            playlist_id
            page
            limit
          ]
        end

        def data
          playlist['items']
        end

        def link
          "#{super}/tracks"
        end

        def params
          {
            **super,
            limit:,
            offset:
          }
        end
      end
    end
  end
end
