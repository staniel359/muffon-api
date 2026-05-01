module Odnoklassniki
  class Base < Muffon::Base
    SOURCE_NAME = 'odnoklassniki'.freeze

    include Muffon::Mixins::GlobalStorage

    private

    def response_data
      @response_data ||=
        Muffon::Request.call(
          url: request_url,
          method: 'GET',
          params: request_params,
          proxy: request_proxy
        )
    end

    def request_url
      "https://wmf.ok.ru/#{endpoint_name};jsessionid=#{session_id}"
    end

    def endpoint_name
      self.class::ENDPOINT_NAME
    end

    def session_id
      return test_session_id if test?

      @session_id ||=
        get_global_value(
          'odnoklassniki:session_id',
          refresh_class_name:
            'Odnoklassniki::Utils::SessionId',
          is_refresh: refresh_session_id?
        )
    end

    def test_session_id
      credentials.dig(
        :odnoklassniki,
        :test_session_id
      )
    end

    def refresh_session_id?
      !!@args[:is_refresh_session_id]
    end

    def request_params
      { imgfmt: 'base' }
    end

    def request_proxy
      proxy_data[:ru].sample
    end

    def retry_with_new_session_id?
      authentication_failed?
    end

    def authentication_failed?
      response_data['error'] == 'error.notloggedin'
    end

    def retry_with_new_session_id
      self.class.call(
        **@args,
        is_refresh_session_id: true
      )
    end
  end
end
