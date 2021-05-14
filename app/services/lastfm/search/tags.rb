module LastFM
  module Search
    class Tags < LastFM::Base
      private

      def primary_args
        [@args.query]
      end

      def no_data?
        response_data.blank?
      end

      def response_data
        @response_data ||= Google::Search.call(params)[:search]
      end

      def params
        {
          query: @args.query,
          scope: 'lastfm_tags',
          page: @args.page
        }
      end

      def data
        { search: search_data }
      end

      def search_data
        {
          page: response_data[:page],
          total_pages: response_data[:total_pages],
          tags: tags_data
        }
      end

      def tags_data
        tags_list.map { |t| tag_data(t) }
      end

      def tags_list
        response_data[:results]
      end

      def tag_data(tag)
        { name: tag_name(tag) }
      end

      def tag_name(tag)
        tag[:title].match(
          /(.+) music | Last.fm/
        )[1].downcase
      end
    end
  end
end
