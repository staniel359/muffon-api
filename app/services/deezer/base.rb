module Deezer
  class Base < Muffon::Base
    def call
      return handlers.bad_request if not_all_args?
      return handlers.not_found if no_data?

      data
    end

    private

    def response_data
      @response_data ||= JSON.parse(response)
    end

    def response
      RestClient.get(link, headers)
    end

    def base_link
      'https://api.deezer.com'
    end

    def headers
      { params: params }
    end

    def params
      {}
    end

    def image_data(data, model)
      Deezer::Utils::Image.call(data: data, model: model)
    end

    def title
      response_data['title']
    end

    def artist_name(data)
      data.dig('artist', 'name')
    end

    def artist_data(data)
      { name: artist_name(data) }
    end
  end
end
