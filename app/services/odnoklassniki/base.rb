module Odnoklassniki
  class Base < Muffon::Base
    SOURCE_ID = 'odnoklassniki'.freeze
    include Muffon::Utils::Global

    def call
      return handlers[:bad_request] if not_all_args?
      return retry_with_new_session_id if auth_failed?
      return handlers[:not_found] if no_data?

      data
    end

    private

    def auth_failed?
      response_data['error'] == 'error.notloggedin'
    end

    def response_data
      @response_data ||= JSON.parse(response)
    end

    def response
      RestClient.get(link, headers)
    end

    def link
      "https://wmf.ok.ru/#{endpoint_name};"\
        "jsessionid=#{session_id}"
    end

    def endpoint_name
      self.class::ENDPOINT_NAME
    end

    def session_id
      return test_session_id if Rails.env.test?

      get_global_value('odnoklassniki_session_id')
    end

    def test_session_id
      secrets.odnoklassniki[:test_session_id]
    end

    def global_value
      Odnoklassniki::Utils::SessionId.call
    end

    def headers
      { params: params }
    end

    def params
      { imgfmt: 'base' }
    end

    def retry_with_new_session_id
      @response_data = nil

      update_global_value('odnoklassniki_session_id')

      call
    end

    def no_data?
      response_data['error'].present?
    end

    def artists
      artists_list.map do |a|
        artist_data_formatted(a)
      end
    end

    def artist_data_formatted(artist)
      {
        name: artist['name'],
        odnoklassniki_id: artist['id']
      }
    end

    def image_data_formatted(image, model)
      Odnoklassniki::Utils::Image.call(
        image: image, model: model
      )
    end
  end
end
