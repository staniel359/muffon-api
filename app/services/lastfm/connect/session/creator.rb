module LastFM
  module Connect
    module Session
      class Creator < LastFM::Connect::Session::Base
        API_METHOD = 'auth.getSession'.freeze

        private

        def primary_args
          super + [
            @args[:lastfm_token]
          ]
        end

        def link
          "#{super}?method=#{api_method}" \
            "&api_key=#{api_key}" \
            "&token=#{lastfm_token}" \
            "&api_sig=#{api_signature}" \
            '&format=json'
        end

        def lastfm_token
          @args[:lastfm_token]
        end

        def api_signature
          Digest::MD5.hexdigest(
            "api_key#{api_key}" \
            'methodauth.getSession' \
            "token#{lastfm_token}" \
            "#{api_secret}"
          )
        end

        def headers
          {}
        end

        def process_profile
          connect_profile

          { profile: profile_data }
        end

        def connect_profile
          profile.update(
            lastfm_nickname: nickname,
            lastfm_session_key: session_key
          )
        end

        def nickname
          response_data.dig(
            'session', 'name'
          )
        end

        def session_key
          response_data.dig(
            'session', 'key'
          )
        end

        def profile_data
          profile.slice(
            :lastfm_nickname,
            :lastfm_session_key
          )
        end
      end
    end
  end
end
