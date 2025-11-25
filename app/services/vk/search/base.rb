module VK
  module Search
    class Base < VK::Base
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
        response_data['items']
      end

      def params
        {
          **super,
          q: query,
          count: limit,
          offset:
        }
      end

      def signature
        "/method/#{api_method}" \
          "?access_token=#{access_token}" \
          '&v=5.131' \
          "&q=#{query}" \
          "&count=#{limit}" \
          "&offset=#{offset}" \
          "#{api_secret}"
      end

      def query
        @args[:query]
      end

      def next_page
        page.to_i + 1
      end
    end
  end
end
