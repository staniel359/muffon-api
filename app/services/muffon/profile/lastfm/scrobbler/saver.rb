module Muffon
  module Profile
    module LastFM
      module Scrobbler
        class Saver < Muffon::Profile::LastFM::Scrobbler::Base
          private

          def payload
            {
              **super,
              track: title,
              artist: artist_name,
              album: album_title,
              timestamp:,
              method: 'track.scrobble',
              format: 'json'
            }.compact
          end

          def api_signature_first_part
            [
              album_title_formatted,
              "api_key#{api_key}",
              "artist#{artist_name}",
              'methodtrack.scrobble',
              "sk#{session_key}",
              "timestamp#{timestamp}",
              "track#{title}"
            ]
              .compact
              .join
          end

          def timestamp
            Time.now.utc
          end
        end
      end
    end
  end
end
