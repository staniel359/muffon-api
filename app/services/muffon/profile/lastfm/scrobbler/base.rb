module Muffon
  module Profile
    module LastFM
      module Scrobbler
        class Base < Muffon::Profile::Base
          BASE_LINK =
            'https://ws.audioscrobbler.com/2.0'.freeze

          private

          def primary_args
            [
              @args.profile_id,
              @args.token,
              @args.title,
              @args.artist,
              @args.duration
            ]
          end

          def data
            return if wrong_profile?

            post_track_data

            { success: true }
          end

          def post_track_data
            RestClient.post(
              BASE_LINK, payload
            )
          end

          def payload
            payload_base_data
              .merge(payload_auth_data)
          end

          def payload_auth_data
            {
              api_key: api_key,
              api_sig: api_sig,
              sk: session_key
            }
          end

          def api_key
            secrets.lastfm[:api_key]
          end

          def api_sig
            Digest::MD5.hexdigest(
              api_sig_raw + api_secret
            )
          end

          def api_secret
            secrets.lastfm[:api_secret]
          end

          def session_key
            profile.lastfm_session_key
          end
        end
      end
    end
  end
end
