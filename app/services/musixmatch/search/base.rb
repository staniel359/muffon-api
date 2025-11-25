module MusixMatch
  module Search
    class Base < MusixMatch::Base
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

      def params
        {
          **super,
          q: @args[:query],
          page:,
          page_size: limit
        }
      end

      def items_count
        response_data.dig(
          'message',
          'header',
          'available'
        )
      end
    end
  end
end
