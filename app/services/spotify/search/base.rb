module Spotify
  module Search
    class Base < Spotify::Base
      MAXIMUM_ITEMS_COUNT = 10_000

      def call
        check_args

        data
      rescue Faraday::UnauthorizedError, Faraday::TooManyRequestsError
        retry_with_new_spotify_token
      rescue Faraday::BadRequestError
        raise bad_request_error
      end

      private

      def required_args
        %i[
          query
        ]
      end

      def data
        { search: search_data }
      end

      def link
        "#{BASE_LINK}/search"
      end

      def params
        {
          **super,
          q: @args[:query],
          limit:,
          offset:
        }
      end
    end
  end
end
