module Spotify
  module User
    class Base < Spotify::Base
      def call
        check_args

        check_if_not_found

        check_if_forbidden

        data
      rescue Faraday::UnauthorizedError
        retry_with_new_session
      end

      private

      def required_args
        if skip_profile?
          %i[
            access_token
          ]
        else
          %i[
            profile_id
            token
          ]
        end
      end

      def skip_profile?
        return true if test?

        !!@args[:skip_profile]
      end

      def not_found?
        if skip_profile?
          false
        else
          profile.blank?
        end
      end

      def forbidden?
        if skip_profile?
          false
        else
          !valid_profile?
        end
      end

      def data
        { user: user_data }
      end

      def link
        "#{BASE_LINK}/me"
      end

      def headers
        {
          'Authorization' =>
            "Bearer #{access_token}",
          'Content-Type' =>
            'application/x-www-form-urlencoded'
        }
      end

      def access_token
        @args[:access_token] ||
          spotify_connection&.access_token
      end

      alias user response_data
    end
  end
end
