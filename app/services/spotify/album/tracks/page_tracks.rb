module Spotify
  module Album
    class Tracks
      class PageTracks < Spotify::Album::Tracks
        def call
          check_args

          data
        end

        private

        def required_args
          %i[
            album_id
            page
            limit
          ]
        end

        def data
          album['items']
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
