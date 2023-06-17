module LastFM
  module Connection
    class Creator < LastFM::Connection::Base
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
        lastfm_connection.update(
          lastfm_connection_params
        )

        return lastfm_connection.errors_data if
            lastfm_connection.errors?

        { profile: profile_data }
      end

      def lastfm_connection
        @lastfm_connection ||=
          LastFMConnection.where(
            profile_id:
              @args[:profile_id]
          ).first_or_initialize
      end

      def lastfm_connection_params
        lastfm_connection_token_params
          .merge(lastfm_connection_info_params)
      end

      def lastfm_connection_token_params
        { session_key: }
      end

      def session_key
        response_data.dig(
          'session', 'key'
        )
      end

      def lastfm_connection_info_params
        lastfm_user_info_data.slice(
          :nickname,
          :premium,
          :image_url
        )
      end

      def lastfm_user_info_data
        LastFM::User::Info.call(
          nickname:,
          skip_profile: true
        )[:user]
      end

      def nickname
        response_data.dig(
          'session', 'name'
        )
      end

      def profile_data
        { connections: connections_data }
      end

      def connections_data
        { lastfm: lastfm_data }
      end

      def lastfm_data
        profile
          .lastfm_connection
          .slice(
            :nickname,
            :premium,
            :image_url
          )
      end
    end
  end
end
