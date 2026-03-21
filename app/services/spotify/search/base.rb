module Spotify
  module Search
    class Base < Spotify::Base
      def call
        raise forbidden_error unless test?

        check_args

        data
      rescue Faraday::UnauthorizedError
        retry_with_new_spotify_token
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

      def maximum_items_count
        pagination_maximum_items_count_data[:search]
      end

      alias response post_response
    end
  end
end
