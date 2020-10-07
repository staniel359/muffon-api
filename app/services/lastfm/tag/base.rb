module LastFM
  module Tag
    class Base < LastFM::Base
      def call
        return not_found_data if parsed_response.text.blank?

        { tag: tag_data }
      end

      private

      def parsed_response
        @parsed_response ||= Nokogiri::HTML.parse(web_response)
      end

      def web_response
        RestClient.get(tag_link, params: params)
      rescue RestClient::NotFound
        nil
      end

      def tag_link
        "https://www.last.fm/tag/#{link_tag_name}/#{collection}"
      end

      def link_tag_name
        CGI.escape(@args.tag.to_s)
      end

      def collection
        @collection ||= self.class.name.demodulize.downcase
      end

      def params
        { page: @args.page }
      end

      def tag_data
        {
          name: tag_name,
          collection.to_sym => send(collection),
          page: page
        }
      end

      def tag_name
        parsed_response.css('title').text.match(
          /Top (.+) #{collection}/
        )[1]
      end

      def page
        (current_page.presence || 1).to_i
      end

      def current_page
        parsed_response.css('.pagination-page span').text
      end
    end
  end
end
