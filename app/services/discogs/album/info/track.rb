module Discogs
  module Album
    class Info
      class Track < Discogs::Album::Info
        def call
          data
        end

        private

        def data
          {
            title: title,
            player_id: player_id,
            artist: artist_formatted,
            artists: artists,
            duration: duration
          }
        end

        def title
          @args.track['title']
        end

        def artists_list
          @args.track['artists']
        end

        def duration
          duration_formatted(
            @args.track['duration']
          )
        end
      end
    end
  end
end
