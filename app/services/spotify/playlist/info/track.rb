module Spotify
  module Playlist
    class Info
      class Track < Spotify::Playlist::Info
        include Spotify::Utils::Track

        def call
          data
        end

        private

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
            player_id:,
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
