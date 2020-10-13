module Google
  class Search < Muffon::Base
    def call
      return bad_request_error if not_all_args?
      return not_found_error if no_data?

      data
    rescue RestClient::TooManyRequests
      too_many_requests_error
    end

    private

    def primary_args
      [@args.query]
    end

    def no_data?
      results.blank?
    end

    def results
      @results ||= nodes.select { |n| result_node?(n) }
    end

    def nodes
      parsed_response.css('.ZINbbc')
    end

    def parsed_response
      @parsed_response ||= Nokogiri::HTML.parse(response)
    end

    def response
      RestClient.get(google_link, params: params)
    end

    def google_link
      'https://www.google.com/search'
    end

    def params
      { q: @args.query, start: start }
    end

    def start
      return if @args.page.to_i.zero?

      (@args.page - 1) * 10
    end

    def result_node?(node)
      node.css('.kCrYT .vvjwJb').any?
    end

    def data
      { search: search_data }
    end

    def search_data
      {
        results: results_data,
        page: page
      }
    end

    def results_data
      results.map do |r|
        {
          title: title(r),
          link: link(r),
          description: description(r)
        }
      end
    end

    def title(result)
      result.css('.vvjwJb')[0].text
    end

    def link(result)
      CGI.parse(
        URI.parse(
          result.css('a')[0]['href']
        ).query
      ).dig('q', 0)
    end

    def description(result)
      result.css('.s3v9rd')[0].text
    end

    def page
      return 1 if pages_block.blank?

      pages_block[0].text[/\d+/][0].to_i
    end

    def pages_block
      parsed_response.css('.SAez4c')
    end

    def too_many_requests_error
      { error: { code: 429, text: 'Too many requests' } }
    end
  end
end
