module AmazonMusic
  module Search
    class Base < AmazonMusic::Base
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

      def payload
        AmazonMusic::Utils::Request::Payload.call(
          query: @args[:query],
          page: @args[:page]
        )
      end

      def raw_collection
        response_data.dig(
          'methods',
          0,
          'template',
          'widgets',
          0,
          'items'
        ) ||
          response_data.dig(
            'methods',
            0,
            'items'
          )
      end

      alias response post_response
    end
  end
end
