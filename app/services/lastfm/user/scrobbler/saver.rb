module LastFM
  module User
    module Scrobbler
      class Saver < LastFM::User::Scrobbler::Base
        private

        def request_payload
          {
            **super,
            method: 'track.scrobble',
            artist: artist_name,
            track: track_title,
            album: album_title,
            timestamp:,
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
            "track#{track_title}"
          ]
            .compact
            .join
        end

        def timestamp
          current_time.utc
        end
      end
    end
  end
end
