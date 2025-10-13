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
            return if lastfm_connection.blank?

            post_response

            { success: true }
          end

          def lastfm_connection
            @lastfm_connection ||=
              profile.lastfm_connection
          end

          def link
            BASE_LINK
          end

          def payload
            {
              api_key:,
              api_sig: api_signature_hex,
              sk: session_key
            }
          end

          def api_key
            credentials.dig(
              :lastfm,
              :api_key
            )
          end

          def api_signature_hex
            Digest::MD5.hexdigest(
              api_signature
            )
          end

          def api_signature
            "#{api_signature_first_part}#{api_secret}"
          end

          def api_secret
            credentials.dig(
              :lastfm,
              :api_secret
            )
          end

          def session_key
            lastfm_connection.session_key
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

          def album_title_formatted
            return if album_title.blank?

            "album#{album_title}"
          end
        end
      end
    end
  end
end
