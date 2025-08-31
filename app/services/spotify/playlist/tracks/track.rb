module Spotify
  module Playlist
    class Tracks
      class Track < Spotify::Playlist::Tracks
        include Spotify::Utils::Track

        def call
          check_args

          data
        end

        private

        def required_args
          %i[
            track
          ]
        end

        def data
          track_base_data
            .merge(track_extra_data)
        end

        def track
          @args[:track]['track']
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

        def track_extra_data
          {
            album: album_data,
            image: image_data,
            duration:,
            created: created_formatted,
            audio: audio_minimal_data
          }.compact
        end

        def created_formatted
          datetime_formatted(
            raw_created
          )
        end

        def raw_created
          @args[:track]['added_at'].to_datetime
        end
      end
    end
  end
end
