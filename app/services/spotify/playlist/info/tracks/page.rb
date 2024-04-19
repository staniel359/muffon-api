module Spotify
  module Playlist
    class Info
      class Tracks
        class Page < Spotify::Playlist::Info::Tracks
          private

          def primary_args
            [
              @args[:playlist_id],
              @args[:page],
              @args[:limit]
            ]
          end

          def data
            response_data['items']
          end

          def link
            "#{super}/tracks"
          end

          def params
            {
              offset:,
              limit:
            }
          end
        end
      end
    end
  end
end
