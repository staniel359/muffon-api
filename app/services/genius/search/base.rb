module Genius
  module Search
    class Base < Genius::Base
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

      def raw_collection
        response_data.dig(
          'response',
          'sections',
          0,
          'hits'
        )
      end

      def params
        {
          q: @args[:query],
          page:,
          per_page: limit
        }
      end
    end
  end
end
