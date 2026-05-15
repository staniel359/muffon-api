module YandexMusic
  module Search
    class Base < YandexMusic::Base
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

      def request_url
        "#{REQUEST_BASE_URL}/search/instant/mixed"
      end

      def request_params
        {
          **super,
          'text' => @args[:query],
          'page' => page - 1,
          'pageSize' => limit
        }
      end

      def raw_collection
        response_data['results']
      end

      def next_page
        return if last_page?

        page + 1
      end

      def last_page?
        response_data['lastPage']
      end
    end
  end
end
