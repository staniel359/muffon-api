module LastFM
  module User
    module Scrobbler
      class Base < LastFM::User::Base
        private

        def required_args
          %i[
            profile_id
            token
            artist_name
            track_title
          ]
        end

        def forbidden?
          !valid_profile?
        end

        def data
          return if lastfm_connection_record.blank?

          post_response

          { success: true }
        end

        def link
          BASE_LINK
        end

        def params
          nil
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
          lastfm_connection_record.session_key
        end

        def artist_name
          @args[:artist_name]
        end

        def track_title
          @args[:track_title]
        end

        def album_title_formatted
          return if album_title.blank?

          "album#{album_title}"
        end

        def album_title
          @args[:album_title]
        end
      end
    end
  end
end
