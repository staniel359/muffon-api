module Spotify
  module Album
    class Info
      class Tracks
        class PageTracks < Spotify::Album::Info::Tracks
          private

          def primary_args
            [
              @args[:album_id],
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
