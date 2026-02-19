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
          query: @args[:query]
        }
      end

      def link
        "#{BASE_LINK}/search.json"
      end
    end
  end
end
