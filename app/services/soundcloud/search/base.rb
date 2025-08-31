module SoundCloud
  module Search
    class Base < SoundCloud::API::V2::Base
      TOTAL_LIMIT = 10_000

      include Muffon::Utils::Pagination

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
        { search: paginated_data }
      end

      def collection_list
        response_data['collection']
      end

      def link
        "#{BASE_LINK}/search/#{collection_name}"
      end

      def params
        {
          **super,
          q: @args[:query],
          limit:,
          offset:
        }
      end

      def collection_count
        response_data['total_results']
      end
    end
  end
end
