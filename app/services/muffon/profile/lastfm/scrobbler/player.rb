module Muffon
  module Profile
    module LastFM
      module Scrobbler
        class Player < Muffon::Profile::LastFM::Scrobbler::Base
          private

          def required_args
            super + %i[
              duration
            ]
          end

          def payload
            {
              **super,
              track: title,
              artist: artist_name,
              album: album_title,
              duration:,
              method:
                'track.updateNowPlaying',
              format: 'json'
            }.compact
          end

          def api_signature_first_part
            [
              album_title_formatted,
              "api_key#{api_key}",
              "artist#{artist_name}",
              "duration#{duration}",
              'methodtrack.updateNowPlaying',
              "sk#{session_key}",
              "track#{title}"
            ]
              .compact
              .join
          end
        end
      end
    end
  end
end
