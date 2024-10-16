module Spotify
  module User
    class Base < Spotify::Base
      private

      def primary_args
        return primary_skip_profile_args if skip_profile?

        [
          @args[:profile_id],
          @args[:token]
        ]
      end

      def skip_profile?
        test? || !!@args[:skip_profile]
      end

      def primary_skip_profile_args
        [@args[:access_token]]
      end

      def no_data?
        return false if skip_profile?

        profile.blank?
      end

      def forbidden?
        return false if skip_profile?

        !valid_profile?
      end

      def data
        { user: user_data }
      rescue Faraday::UnauthorizedError
        retry_with_new_session
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
    end
  end
end
