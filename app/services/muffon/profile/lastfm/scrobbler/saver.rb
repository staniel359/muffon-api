module Muffon
  module Profile
    module LastFM
      module Scrobbler
        class Saver < Muffon::Profile::LastFM::Scrobbler::Base
          private

          def payload_base_data
            {
              track: title,
              artist: artist_name,
              album: album_title,
              timestamp: timestamp,
              method: 'track.scrobble',
              format: 'json'
            }.compact
          end

          def api_sig_raw
            [
              album_title_string,
              "api_key#{api_key}",
              "artist#{artist_name}",
              'methodtrack.scrobble',
              "sk#{session_key}",
              "timestamp#{timestamp}",
              "track#{title}"
            ].compact.join
          end

          def timestamp
            Time.now.utc
          end
        end
      end
    end
  end
end
