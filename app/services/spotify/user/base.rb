module Spotify
  module User
    class Base < Spotify::Base
      REQUEST_BASE_URL = 'https://api.spotify.com/v1'.freeze

      def call
        check_args

        check_if_not_found unless skip_profile?

        check_if_forbidden unless skip_profile?

        data
      rescue Faraday::UnauthorizedError
        retry_with_new_session
      rescue Faraday::ForbiddenError
        raise forbidden_error
      end

      private

      def required_args
        if skip_profile?
          if test?
            []
          else
            %i[
              access_token
            ]
          end
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
        profile_record.blank?
      end

      def forbidden?
        !valid_profile?
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
        return test_access_token if test?

        @args[:access_token] ||
          spotify_connection&.access_token
      end

      def test_access_token
        credentials.dig(
          :spotify,
          :test_user_token
        )
      end

      def retry_with_new_session
        session_update_result = update_session

        raise not_found_error unless session_update_result[:success]

        spotify_connection.reload

        call
      end

      def update_session
        Spotify::Connection::Updater.call(
          **self_args
        )
      end

      alias raw_user_data response_data
    end
  end
end
