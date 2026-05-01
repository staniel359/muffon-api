module LastFM
  module User
    module Scrobbler
      class Player < LastFM::User::Scrobbler::Base
        private

        def required_args
          [
            *super,
            :duration
          ]
        end

        def request_payload
          {
            **super,
            method: 'track.updateNowPlaying',
            artist: artist_name,
            track: track_title,
            album: album_title,
            duration:,
            format: 'json'
          }.compact
        end

        def duration
          @args[:duration]
        end

        def api_signature_first_part
          [
            album_title_formatted,
            "api_key#{api_key}",
            "artist#{artist_name}",
            "duration#{duration}",
            'methodtrack.updateNowPlaying',
            "sk#{session_key}",
            "track#{track_title}"
          ]
            .compact
            .join
        end
      end
    end
  end
end
