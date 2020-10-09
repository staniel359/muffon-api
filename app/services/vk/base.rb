module VK
  class Base < Muffon::Base
    PAGE_ID = 223_233_444

    def call
      return bad_request_error if primary_args.any?(&:blank?)
      return not_found_error if no_data?

      data
    end

    private

    def response_to_json
      response.sub('<!--', '')
    end

    def response
      RestClient.post(
        'https://vk.com/al_audio.php',
        request_params, cookies: { remixsid: remixsid }
      )
    end

    def remixsid
      secrets.vk.dig(:remixsid, Rails.env.to_sym)
    end
  end
end
