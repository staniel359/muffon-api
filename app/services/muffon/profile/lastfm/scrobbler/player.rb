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

          def payload_base_data
            {
              track: title,
              artist: artist_name,
              album: album_title,
              duration:,
              method: 'track.updateNowPlaying',
              format: 'json'
            }.compact
          end

          def api_sig_raw
            [
              album_title_string,
              "api_key#{api_key}",
              "artist#{artist_name}",
              "duration#{duration}",
              'methodtrack.updateNowPlaying',
              "sk#{session_key}",
              "track#{title}"
            ].compact.join
          end
        end
      end
    end
  end
end
