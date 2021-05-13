module Genius
  module Search
    class Base < Genius::Base
      include Muffon::Utils::Paginated

      private

      def primary_args
        [@args.query]
      end

      def no_data?
        collection_list.empty?
      end

      def collection_list
        @collection_list ||= response_data.dig(
          'response', 'sections', 0, 'hits'
        )
      end

      def response_data
        JSON.parse(response)
      end

      def response
        RestClient.get(link, headers)
      end

      def link
        "https://genius.com/api/search/#{model_name}"
      end

      def headers
        { params: params }
      end

      def params
        {
          q: @args.query,
          page: page,
          per_page: limit
        }
      end

      def data
        { search: search_data }
      end

      def search_data
        {
          page: page,
          collection_name.to_sym => collection_data
        }
      end

      def collection_data
        collection_list.map do |i|
          collection_item_data(i['result'])
        end
      end
    end
  end
end
