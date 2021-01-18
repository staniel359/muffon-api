module Google
  class Search < Muffon::Base
    def call
      return handlers.bad_request if not_all_args?
      return handlers.not_found if no_data?

      data
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
      response_data.css('.ZINbbc')
    end

    def response_data
      @response_data ||= Nokogiri::HTML.parse(response)
    end

    def response
      RestClient.get(link, headers)
    end

    def link
      'https://www.google.com/search'
    end

    def headers
      {
        'Cookie' => cookie,
        params: params
      }
    end

    def cookie
      return '' if Rails.env.production?

      'GOOGLE_ABUSE_EXEMPTION=ID=00f4d94532e7fc7d'\
        ":TM=1610958213:C=r:IP=#{Muffon::IP.call}-"\
        ':S=APGng0uPsxRmCfpoakb2T0c3vkDB5vDMeQ'
    end

    def params
      { q: @args.query, start: offset, num: limit }
    end

    def offset
      return 0 if @args.page.to_i.zero?

      (@args.page.to_i - 1) * limit
    end

    def limit
      (@args.limit || 20).to_i
    end

    def result_node?(node)
      node.css('.kCrYT .vvjwJb').any?
    end

    def data
      { search: search_data }
    end

    def search_data
      {
        page: page,
        results: results_data
      }
    end

    def results_data
      results.map do |r|
        {
          title: result_title(r),
          link: result_link(r),
          description: description(r)
        }
      end
    end

    def result_title(result)
      result.css('.vvjwJb')[0].text
    end

    def result_link(result)
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
      response_data.css('.SAez4c')
    end
  end
end
