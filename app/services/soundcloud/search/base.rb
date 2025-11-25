module SoundCloud
  module Search
    class Base < SoundCloud::API::V2::Base
      MAXIMUM_ITEMS_COUNT = 10_000

      def call
        check_args

        data
      rescue Faraday::UnauthorizedError
        retry_with_new_client_id
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

      def raw_collection
        response_data['collection']
      end

      def params
        {
          **super,
          q: @args[:query],
          limit:,
          offset:
        }
      end

      def items_count
        response_data['total_results']
      end
    end
  end
end
