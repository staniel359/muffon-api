module Spotify
  module User
    class Tracks
      class Track < Spotify::User::Tracks
        include Spotify::Utils::Track

        def call
          data
        end

        private

        def data
          {
            source: source_data,
            title:,
            artist: artists_minimal_data,
            artists:,
            album: album_data,
            image: image_data,
            created: created_formatted,
            audio: audio_minimal_data
          }.compact
        end

        def track
          @args[:track]['track']
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
