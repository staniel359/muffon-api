module VK
  module Search
    class Base < VK::Base
      def call
        # TODO: to remove later
        raise not_found_error unless test?

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

      def request_params
        {
          **super,
          q: @args[:query],
          count: limit,
          offset:
        }
      end

      def request_raw_signature
        "/method/#{api_method}" \
          "?access_token=#{access_token}" \
          '&v=5.131' \
          "&q=#{@args[:query]}" \
          "&count=#{limit}" \
          "&offset=#{offset}" \
          "#{api_secret}"
      end

      def next_page
        page.to_i + 1
      end
    end
  end
end
