module MusixMatch
  module Search
    class Base < MusixMatch::Base
      def call
        check_args

        data
      rescue Faraday::ResourceNotFound => e
        handle_not_found_error(e)
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
        "#{base_link}/search.json"
      end
    end
  end
end
