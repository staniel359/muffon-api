module AmazonMusic
  module Utils
    module Pagination
      include Muffon::Utils::Pagination

      private

      def total_pages_count
        nil
      end

      def page
        nil
      end

      def next_page
        return if next_page_url.blank?

        next_page_url_query_data['next']
      end

      def next_page_url
        @next_page_url ||=
          first_page_next_page_url ||
          other_pages_next_page_url
      end

      def first_page_next_page_url
        response_data.dig(
          'methods', 0,
          'template', 'widgets', 0,
          'onEndOfWidget', 0, 'url'
        )
      end

      def other_pages_next_page_url
        response_data.dig(
          'methods', 0,
          'onEndOfWidget', 0, 'url'
        )
      end

      def next_page_url_query_data
        parse_query_string(
          link: next_page_url
        )
      end

      def collection_list
        @collection_list ||=
          first_page_collection_list ||
          other_pages_collection_list || []
      end

      def first_page_collection_list
        response_data.dig(
          'methods', 0,
          'template', 'widgets', 0,
          'items'
        )
      end

      def other_pages_collection_list
        response_data.dig(
          'methods', 0,
          'items'
        )
      end
    end
  end
end
