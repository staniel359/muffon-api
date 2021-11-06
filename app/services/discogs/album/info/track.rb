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
          muffon_data.merge(track_data)
        end

        def track_data
          {
            id: id,
            player_id: player_id,
            source_id: 'lastfm',
            title: title,
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
