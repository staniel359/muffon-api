module Spotify
  module Search
    class Base < Spotify::Base
      TOTAL_LIMIT = 10_000

      include Spotify::Utils::Pagination

      def call
        check_args

        data
      rescue Faraday::UnauthorizedError, Faraday::TooManyRequestsError
        retry_with_new_spotify_token
      end

      private

      def required_args
        %i[
          query
        ]
      end

      def data
        { search: paginated_data }
      end

      def collection_list
        response_data.dig(
          collection_name,
          'items'
        )
      end

      def link
        "#{BASE_LINK}/search"
      end

      def params
        {
          **super,
          q: @args[:query],
          type: collection_type,
          **pagination_params
        }
      end

      def collection_type
        self.class::COLLECTION_TYPE
      end

      def collection_count
        response_data.dig(
          collection_name,
          'total'
        )
      end
    end
  end
end
