module Odnoklassniki
  class Base < Muffon::Base
    SOURCE_NAME = 'odnoklassniki'.freeze

    include Muffon::Utils::Global

    def call
      return bad_request if not_all_args?
      return retry_with_new_session_id if auth_failed?
      return not_found if no_data?

      data
    rescue Faraday::BadRequestError
      not_found
    end

    private

    def auth_failed?
      response_data['error'] ==
        'error.notloggedin'
    end

    def response
      format_get_request(
        link:,
        params:,
        proxy:
      )
    end

    def link
      "https://wmf.ok.ru/#{endpoint_name};" \
        "jsessionid=#{session_id}"
    end

    def endpoint_name
      self.class::ENDPOINT_NAME
    end

    def session_id
      return test_session_id if test?

      get_global_value(
        'odnoklassniki_session_id'
      )
    end

    def test_session_id
      credentials.dig(
        :odnoklassniki,
        :test_session_id
      )
    end

    def global_value
      @global_value ||=
        Odnoklassniki::Utils::SessionId.call
    end

    def params
      { imgfmt: 'base' }
    end

    def retry_with_new_session_id
      return not_found if global_value.blank?

      @global_value = nil
      @response_data = nil

      update_global_value(
        'odnoklassniki_session_id'
      )

      call
    end

    def no_data?
      response_data['error'].present?
    end

    def artist_data_formatted(artist)
      {
        source:
          artist_source_data(artist),
        name: artist['name']
      }
    end

    def artist_source_data(artist)
      {
        name: source_name,
        id: artist['id']
      }
    end

    def image_data_formatted(image)
      Odnoklassniki::Utils::Image.call(
        image:
      )
    end

    alias artist_name artists_names
  end
end
