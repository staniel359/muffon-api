module Discogs
  module Album
    class Info
      class Track < Discogs::Album::Info
        include Muffon::Utils::Track

        def call
          check_args

          data
        end

        private

        def required_args
          %i[
            track
            artists
            album_data
          ]
        end

        def data
          self_data
            .merge(track_base_data)
            .merge(track_extra_data)
        end

        def title
          track['title']
        end

        def track
          @args[:track]
        end

        def track_base_data
          {
            source: source_data,
            player_id: player_source_id,
            title:,
            artist: artists_minimal_data,
            artists:
          }
        end

        def source_data
          { name: 'lastfm' }
        end

        def raw_artists
          track['artists'] ||
            @args[:artists]
        end

        def track_extra_data
          {
            album: album_data,
            image: image_data,
            duration:
          }.compact
        end

        def album_data
          @args[:album_data]
        end

        def image_data
          album_data[:image]
        end

        def duration
          duration_string_to_seconds(
            raw_duration
          )
        end

        def raw_duration
          track['duration']
        end
      end
    end
  end
end
