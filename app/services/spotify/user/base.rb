module Spotify
  module User
    class Base < Spotify::Base
      REQUEST_BASE_URL = 'https://api.spotify.com/v1'.freeze

      def call
        check_args

        check_if_not_found

        check_if_forbidden

        data
      rescue Faraday::UnauthorizedError
        retry_with_new_session
      rescue Faraday::ForbiddenError
        raise forbidden_error
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

      def response_data
        @response_data ||=
          Muffon::Request.call(
            url: request_url,
            method: 'GET',
            params: request_params,
            headers: request_headers
          )
      end

      def request_url
        "#{REQUEST_BASE_URL}/me"
      end

      def request_params
        {}
      end

      def request_headers
        {
          'Authorization' => "Bearer #{access_token}",
          'Content-Type' =>
            'application/x-www-form-urlencoded'
        }
      end

      def access_token
        @args[:access_token] ||
          spotify_connection&.access_token
      end

      alias raw_user_data response_data
    end
  end
end
