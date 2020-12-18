module Bandcamp
  class Base < Muffon::Base
    def call
      return handlers.bad_request if not_all_args?
      return handlers.not_found if no_data?

      yield if block_given?

      data
    rescue RestClient::NotFound, SocketError
      handlers.not_found
    end

    private

    def response_data
      Nokogiri::HTML.parse(response)
    end

    def response
      RestClient.get(link)
    end
  end
end
