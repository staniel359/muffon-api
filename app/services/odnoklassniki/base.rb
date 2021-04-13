module Odnoklassniki
  class Base < Muffon::Base
    def call
      return handlers.bad_request if not_all_args?
      return retry_with_new_session_id if auth_failed?
      return handlers.not_found if no_data?

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
      "https://wmf.ok.ru/#{endpoint_name};jsessionid=#{session_id}"
    end

    def session_id
      if Rails.env.test?
        secrets.odnoklassniki[:test_session_id]
      else
        global.get('odnoklassniki_session_id')
      end
    end

    def headers
      { params: params }
    end

    def params
      { imgfmt: 'base' }
    end

    def retry_with_new_session_id
      global.set('odnoklassniki_session_id', new_session_id)
      @response_data = nil
      call
    end

    def new_session_id
      Odnoklassniki::Utils::SessionId.call
    end

    def no_data?
      response_data['error'].present?
    end

    def artist_data(data)
      { name: artist_name(data) }
    end

    def artist_name(data)
      data['ensemble']
    end

    def image_data(data, model)
      Odnoklassniki::Utils::Image.call(
        image: data['image'], model: model
      )
    end

    def released(album)
      return '' if album['year'].zero?

      album['year'].to_s
    end

    def audio_data(track)
      {
        present: audio_id(track).present?,
        id: audio_id(track),
        source: 'odnoklassniki'
      }
    end

    def audio_id(track)
      track['idForDownload'] || track['id']
    end
  end
end
