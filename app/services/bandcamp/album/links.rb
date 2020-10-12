module Bandcamp
  module Album
    class Links < Muffon::Base
      def call
        return bad_request_error if not_all_args?
        return not_found_error if no_data?

        data
      end

      private

      def primary_args
        [@args.query]
      end

      def no_data?
        search_results.blank?
      end

      def search_results
        @search_results ||= Google::Search.call(
          query: "#{@args.query} bandcamp"
        ).dig(:search, :results)
      end

      def data
        { links: links_data }
      end

      def links_data
        search_results.select do |r|
          r[:link][album_regexp].present?
        end
      end

      def album_regexp
        %r{https?://(\w+(?:-\w+)*.bandcamp.com
          /(?:album|track)/\w+(?:-\w+)*)}x
      end
    end
  end
end
