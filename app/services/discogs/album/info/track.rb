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
          self_data
            .merge(track_data)
        end

        def title
          track['title']
        end

        def track
          @args[:track]
        end

        def track_data
          {
            source: source_data,
            player_id:,
            title:,
            artist: artists_minimal_data,
            artists:,
            duration:
          }
        end

        def source_data
          { name: 'lastfm' }
        end

        def artists_list
          track['artists'] ||
            @args[:artists]
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
