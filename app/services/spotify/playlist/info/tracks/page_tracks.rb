module Spotify
  module Playlist
    class Info
      class Tracks
        class PageTracks < Spotify::Playlist::Info::Tracks
          private

          def primary_args
            [
              @args[:playlist_id],
              @args[:page]
            ]
          end

          def data
            response_data['items']
          end

          def link
            "#{super}/tracks"
          end
        end
      end
    end
  end
end
