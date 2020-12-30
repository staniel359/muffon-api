module Bing
  class Search
    class Result < Bing::Search
      def call
        result_data
      end

      private

      def result_data
        {
          title: title,
          link: link,
          description: description
        }
      end

      def title
        link_title[0].text.presence ||
          link_title[1].text.presence ||
          link_title[2].text
      end

      def link_title
        @args.result.css('a:not(.sh_favicon)')
      end

      def link
        link_title[0]['href']
      end

      def description
        base_text.presence || wiki_text.presence || snippet_text
      end

      def base_text
        @args.result.css('.b_caption p').text
      end

      def wiki_text
        @args.result.css('.b_paractl').text
      end

      def snippet_text
        @args.result.css('.b_snippetBigText').text
      end
    end
  end
end
