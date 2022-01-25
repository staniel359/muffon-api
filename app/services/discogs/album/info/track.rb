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
          muffon_data
            .merge(track_data)
        end

        def track_data
          {
            player_id:,
            source_id: 'lastfm',
            title:,
            artists:,
            duration:
          }
        end

        def title
          track['title']
        end

        def track
          @args[:track]
        end

        def artists_list
          track['artists']
        end

        def duration
          duration_formatted(
            track['duration']
          )
        end
      end
    end
  end
end
