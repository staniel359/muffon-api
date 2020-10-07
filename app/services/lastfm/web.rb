module LastFM
  class Web < Muffon::Base
    def call
      return not_found_error if parsed_response.text.blank?

      data
    end

    private

    def parsed_response
      @parsed_response ||= Nokogiri::HTML.parse(response)
    end

    def response
      RestClient.get(link, params: params)
    rescue RestClient::NotFound
      nil
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
