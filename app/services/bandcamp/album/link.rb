module Bandcamp
  module Album
    class Link < Muffon::Base
      def call
        return bad_request_error if not_all_args?
        return not_found_error if no_data?

        data
      end

      private

      def primary_args
        [@args.artist, @args.album]
      end

      def no_data?
        search_results.blank? || matched_link.blank?
      end

      def search_results
        @search_results ||= Bandcamp::Search.call(
          query: query
        ).dig(:search, :results)
      end

      def query
        primary_args.join(' ')
      end

      def data
        { link: matched_link[:link] }
      end

      def matched_link
        @matched_link ||=
          search_results.find { |r| matched_title?(r) }
      end

      def matched_title?(result)
        result[:title].match(
          artist_album_matcher
        ).present?
      end

      def artist_album_matcher
        /(#{@args.album}(?: EP)?)(?: \| )(#{@args.artist})/i
      end
    end
  end
end
