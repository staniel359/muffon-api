module Odnoklassniki
  class Base < Muffon::Base
    SOURCE_NAME = 'odnoklassniki'.freeze

    private

    def retry_with_new_session_id?
      auth_failed?
    end

    def auth_failed?
      response_data['error'] == 'error.notloggedin'
    end

    def link
      "https://wmf.ok.ru/#{endpoint_name};jsessionid=#{session_id}"
    end

    def endpoint_name
      self.class::ENDPOINT_NAME
    end

    def params
      { imgfmt: 'base' }
    end

    def proxy
      proxies[:ru]
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

    def retry_with_new_session_id
      self.class.call(
        **@args,
        is_refresh_session_id: true
      )
    end

    def artist_data_formatted(
      raw_artist_data
    )
      {
        source: artist_source_data(
          raw_artist_data
        ),
        name: raw_artist_data['name']
      }
    end

    def artist_source_data(
      raw_artist_data
    )
      {
        name: source_name,
        id: raw_artist_data['id']
      }
    end

    def image_data_formatted(image)
      Odnoklassniki::Utils::Image.call(
        image:
      )
    end

    def tag_name_formatted(
      tag_data
    )
      tag_data['label']
    end

    alias artist_name artists_names
  end
end
