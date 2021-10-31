module LastFM
  module Connect
    class Session < LastFM::Base
      API_METHOD = 'auth.getSession'.freeze

      private

      def primary_args
        [
          @args.token,
          @args.profile_id
        ]
      end

      def link
        "#{super}?method=#{api_method}"\
          "&api_key=#{api_key}"\
          "&token=#{@args.token}"\
          "&api_sig=#{api_signature}"\
          '&format=json'
      end

      def headers
        {}
      end

      def api_signature
        Digest::MD5.hexdigest(
          "api_key#{api_key}"\
          'methodauth.getSession'\
          "token#{@args.token}"\
          "#{api_secret}"
        )
      end

      def data
        connect_profile

        { session: session_data }
      end

      def connect_profile
        return if profile.blank?

        profile.update(
          lastfm_session_key: session_key
        )
      end

      def session_key
        response_data.dig(
          'session', 'key'
        )
      end

      def session_data
        {
          nickname: nickname,
          session_key: session_key
        }
      end

      def nickname
        response_data.dig(
          'session', 'name'
        )
      end
    end
  end
end
