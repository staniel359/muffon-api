module VK
  class Base < Muffon::Base
    BASE_LINK = 'https://vk.com/al_audio.php'.freeze
    SOURCE_ID = 'vk'.freeze
    include Muffon::Utils::Global

    def call
      return bad_request if not_all_args?
      return retry_with_new_session_id if auth_failed?
      return not_found if no_data?

      data
    end

    private

    def auth_failed?
      response_data[0] == '3'
    end

    def response_data
      @response_data ||= JSON.parse(
        response_to_json
      )['payload']
    end

    def response_to_json
      response.sub('<!--', '')
    end

    def response
      RestClient.post(link, params, headers)
    end

    def link
      BASE_LINK
    end

    def headers
      { cookies: cookies }
    end

    def cookies
      { remixsid: session_id }
    end

    def session_id
      return test_session_id if Rails.env.test?

      get_global_value('vk_session_id')
    end

    def test_session_id
      secrets.vk[:session_id]
    end

    def global_value
      @global_value ||= VK::Utils::SessionId.call
    end

    def retry_with_new_session_id
      return if global_value.blank?

      update_global_value('vk_session_id')

      @response_data = nil
      @global_value = nil

      call
    end

    def no_data?
      response_data[0] == '8'
    end

    def artist_data_formatted(data)
      { name: artist_name_formatted(data) }
    end

    def artist_name_formatted(data)
      CGI.unescapeHTML(
        raw_artist_name(data) ||
          'Various Artists'
      )
    end

    def raw_artist_name(data)
      data['authorLine'].match(
        %r{<a.+>(.+)</a>}
      ).try(:[], 1)
    end

    def image_data_formatted(image, model)
      VK::Utils::Image.call(
        image: image, model: model
      )
    end

    def vk_owner_id
      secrets.vk[:page_id]
    end
  end
end
