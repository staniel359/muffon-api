module LastFM
  class Web < LastFM::Base
    def call
      super
    rescue RestClient::NotFound
      not_found_error
    rescue RestClient::Exceptions::OpenTimeout
      timeout_error
    rescue RestClient::InternalServerError
      server_error
    end

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
      { page: @args.page }
    end

    def page
      return 1 if current_page.blank?

      current_page.scan(/\d+/).join.to_i
    end

    def current_page
      response_data.css('.pagination-page span').text
    end
  end
end
