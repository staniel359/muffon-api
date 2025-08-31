module YouTubeMusic
  module Search
    class Base < YouTubeMusic::Base
      include Muffon::Utils::Pagination

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

      def collection_list
        raw_data['contents'] || []
      end

      def raw_data
        raw_first_page_data ||
          raw_next_page_data ||
          {}
      end

      def raw_first_page_data
        response_data.dig(
          'contents',
          'tabbedSearchResultsRenderer',
          'tabs',
          0,
          'tabRenderer',
          'content',
          'sectionListRenderer',
          'contents',
          0,
          'musicShelfRenderer'
        )
      end

      def link
        BASE_LINK
      end

      def payload
        {
          context: context_data,
          query: @args[:query],
          params: scope_params
        }.to_json
      end

      def scope_params
        YouTubeMusic::Search::ScopeParams.call(
          query: @args[:query],
          scope:
        )
      end

      def scope
        self.class::SCOPE
      end

      def params
        { continuation: @args[:page] }
      end

      def raw_next_page_data
        response_data.dig(
          'continuationContents',
          'musicShelfContinuation'
        )
      end

      def next_page
        raw_data.dig(
          'continuations',
          0,
          'nextContinuationData',
          'continuation'
        )
      end

      def page
        nil
      end

      def total_pages_count
        nil
      end

      alias search_data paginated_data
      alias response post_response
    end
  end
end
