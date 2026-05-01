module Audius
  module Search
    class Base < Audius::Base
      PAGE_LIMIT = 500

      def call
        check_args

        data
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

      def request_url
        "#{REQUEST_BASE_URL}/search/full"
      end

      def request_params
        {
          **super,
          query: @args[:query],
          offset:,
          limit: PAGE_LIMIT
        }
      end
    end
  end
end
