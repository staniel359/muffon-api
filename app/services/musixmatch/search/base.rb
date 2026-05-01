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

      def request_url
        "#{super}/search.json"
      end

      def request_params
        {
          **super,
          query: @args[:query]
        }
      end
    end
  end
end
