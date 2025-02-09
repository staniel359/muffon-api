module AmazonMusic
  module Search
    class Base < AmazonMusic::Base
      include AmazonMusic::Utils::Pagination

      private

      def primary_args
        [@args[:query]]
      end

      def data
        { search: paginated_data }
      end

      def payload
        AmazonMusic::Utils::Request::Payload.call(
          query: @args[:query],
          page: @args[:page]
        )
      end

      alias response post_response
    end
  end
end
