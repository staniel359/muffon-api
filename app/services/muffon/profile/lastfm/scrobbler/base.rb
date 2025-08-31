module Muffon
  module Profile
    module LastFM
      module Scrobbler
        class Base < Muffon::Profile::Base
          BASE_LINK =
            'https://ws.audioscrobbler.com/2.0'.freeze

          private

          def required_args
            super + %i[
              token
              track_title
              artist_name
            ]
          end

          def forbidden?
            !valid_profile?
          end

          def data
            post_response

            { success: true }
          end

          def link
            BASE_LINK
          end

          def payload
            payload_base_data
              .merge(payload_auth_data)
          end

          def title
            @args[:track_title]
          end

          def artist_name
            @args[:artist_name]
          end

          def album_title
            @args[:album_title]
          end

          def duration
            @args[:duration]
          end

          def payload_auth_data
            {
              api_key:,
              api_sig:,
              sk: session_key
            }
          end

          def api_key
            credentials.dig(
              :lastfm,
              :api_key
            )
          end

          def api_sig
            Digest::MD5.hexdigest(
              api_sig_raw + api_secret
            )
          end

          def api_secret
            credentials.dig(
              :lastfm,
              :api_secret
            )
          end

          def session_key
            profile
              .lastfm_connection
              &.session_key
          end

          def album_title_string
            return if album_title.blank?

            "album#{album_title}"
          end
        end
      end
    end
  end
end
