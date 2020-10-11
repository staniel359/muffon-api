module VK
  class Web < VK::Base
    private

    def no_data?
      wrong_request?
    end

    def wrong_request?
      response_code.to_i == 8
    end

    def response_code
      parsed_response[0].to_i
    end

    def parsed_response
      @parsed_response ||= JSON.parse(
        response_to_json
      )['payload']
    end

    def response_to_json
      response.sub('<!--', '')
    end

    def response
      RestClient.post(
        'https://vk.com/al_audio.php',
        request_params, cookies
      )
    end

    def cookies
      { cookies: { remixsid: remixsid } }
    end

    def remixsid
      global.get('remixsid')
    end

    def auth_failed?
      response_code.to_i == 3
    end
  end
end
