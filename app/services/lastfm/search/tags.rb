module LastFM
  module Search
    class Tags < LastFM::Search::Base
      COLLECTION_NAME = 'tags'.freeze

      private

      def primary_args
        [@args.query]
      end

      def no_data?
        response_data.blank?
      end

      def response_data
        @response_data ||= Google::Search.call(
          params
        )[:search]
      end

      def params
        {
          query: @args.query,
          scope: 'lastfm_tags',
          page: @args.page
        }
      end

      def page
        response_data[:page]
      end

      def total_pages_count
        response_data[:total_pages]
      end

      def tags_list
        response_data[:results]
      end

      def tag_name_formatted(tag)
        tag[:title].match(
          /(.+) music | Last.fm/
        )[1].downcase
      end

      alias collection tags
    end
  end
end
