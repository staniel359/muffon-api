module Deezer
  class Base < Muffon::Base
    BASE_LINK = 'https://www.deezer.com/ajax/gw-light.php'.freeze
    SOURCE_ID = 'deezer'.freeze

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
      RestClient.post(link, payload, headers)
    end

    def link
      BASE_LINK
    end

    def payload
      {}
    end

    def headers
      {
        params: params,
        cookies: cookies
      }
    end

    def params
      {
        method: api_method,
        api_version: '1.0',
        api_token: api_token
      }
    end

    def api_method
      self.class::API_METHOD
    end

    def api_token
      Deezer::Utils::Token::User.call[:api_token]
    end

    def cookies
      { sid: session_id }
    end

    def session_id
      secrets.deezer[:session_id]
    end

    def image_data_formatted(image_id, model)
      Deezer::Utils::Image.call(
        image_id: image_id, model: model
      )
    end

    def user_tokens
      @user_tokens ||= Deezer::Utils::Token::User.call
    end

    def artists
      artists_list.map do |a|
        artist_data_formatted(a)
      end
    end

    def artist_data_formatted(data)
      {
        name: data['ART_NAME'],
        deezer_id: data['ART_ID'].to_i
      }
    end

    def album_data_formatted(data)
      return {} if data['ALB_TITLE'].blank?

      {
        title: data['ALB_TITLE'],
        deezer_id: data['ALB_ID'].to_i
      }
    end
  end
end
