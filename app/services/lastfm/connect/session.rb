module LastFM
  module Connect
    class Session < LastFM::Base
      API_METHOD = 'auth.getSession'.freeze

      private

      def primary_args
        [@args.token]
      end

      def link
        "#{super}?method=#{api_method}"\
          "&api_key=#{api_key}&token=#{@args.token}"\
          "&api_sig=#{api_signature}&format=json"
      end

      def headers
        {}
      end

      def api_signature
        Digest::MD5.hexdigest(
          "api_key#{api_key}"\
          'methodauth.getSessiontoken'\
          "#{@args.token}#{api_secret}"
        )
      end

      def data
        { session: session_data }
      end

      def session_data
        { nickname: nickname }
      end

      def nickname
        response_data.dig(
          'session', 'name'
        )
      end
    end
  end
end
