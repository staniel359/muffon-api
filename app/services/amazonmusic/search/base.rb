module AmazonMusic
  module Search
    class Base < AmazonMusic::Base
      include AmazonMusic::Utils::Pagination

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
