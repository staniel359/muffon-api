module Discogs
  module Album
    class Info
      class Track < Discogs::Album::Info
        include Muffon::Utils::Track

        def call
          data
        end

        private

        def data
          {
            library_id: library_id,
            title: title,
            player_id: player_id,
            artist: artist_formatted,
            artists: artists,
            duration: duration
          }.compact
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
