module LastFM
  class Web < LastFM::Base
    private

    def no_data?
      response_data.text.blank?
    end

    def response_data
      @response_data ||= Nokogiri::HTML.parse(response)
    end

    def response
      RestClient.get(link, params: params)
    end

    def params
      { page: (page if @args.page.present?) }
    end

    def page
      [@args.page.to_i, 1].max
    end

    def total_pages
      return 1 if last_page.blank?

      last_page.text.strip.to_i
    end

    def last_page
      response_data.css('.pagination-page').last
    end
  end
end
