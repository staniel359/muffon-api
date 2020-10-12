module LastFM
  class Web < LastFM::Base
    def call
      super
    rescue RestClient::NotFound
      not_found_error
    end

    private

    def no_data?
      parsed_response.text.blank?
    end

    def parsed_response
      @parsed_response ||= Nokogiri::HTML.parse(response)
    end

    def response
      RestClient.get(link, params: params)
    end

    def params
      { page: @args.page }
    end

    def page
      (current_page.presence || 1).to_i
    end

    def current_page
      parsed_response.css('.pagination-page span').text
    end
  end
end