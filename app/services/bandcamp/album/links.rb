module Bandcamp
  module Album
    class Links < Bandcamp::Base
      private

      def primary_args
        [@args.artist, @args.album]
      end

      def no_data?
        search_results.blank? || matched_links.blank?
      end

      def search_results
        @search_results ||=
          search_response.dig(:search, :results)
      end

      def search_response
        Bandcamp::Search.call(query: query)
      end

      def query
        primary_args.join(' ')
      end

      def matched_links
        @matched_links ||= search_results.select do |r|
          with_matched_title?(r)
        end
      end

      def with_matched_title?(result)
        result[:title].match(
          artist_album_regexp
        ).present?
      end

      def artist_album_regexp
        /(#{@args.album}(?: EP)?)(?: \| )(#{@args.artist})/i
      end

      def data
        { links: links_data }
      end

      def links_data
        matched_links.map do |l|
          {
            artist: album_artist(l)[1],
            album: album_artist(l)[0],
            link: l[:link]
          }
        end
      end

      def album_artist(link)
        link[:title].split(' | ')
      end
    end
  end
end
