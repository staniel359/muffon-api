module VK
  class Web < VK::Base
    def call
      return handlers.bad_request if not_all_args?
      return retry_with_new_session_id if auth_failed?
      return handlers.not_found if no_data?

      data
    end

    private

    def auth_failed?
      response_code == 3
    end

    def response_code
      response_data[0].to_i
    end

    def response_data
      @response_data ||=
        JSON.parse(response_to_json)['payload']
    end

    def response_to_json
      response.sub('<!--', '')
    end

    def link
      'https://vk.com/al_audio.php'
    end

    def headers
      { cookies: { remixsid: global.get('vk_session_id') } }
    end

    def retry_with_new_session_id
      global.set('vk_session_id', new_session_id)
      @response_data = nil

      global.get('vk_session_id').present? ? call : handlers.not_found
    end

    def new_session_id
      VK::Utils::SessionId.call
    end

    def no_data?
      response_code == 8
    end

    def album_title(album)
      return '' if album.blank?

      album = album.transform_keys { |k| k.downcase.to_sym }

      full_title(album[:title], album[:subtitle])
    end

    def full_title(title, subtitle)
      subtitle_text = "(#{subtitle})" if subtitle.present?
      full_text = [title, subtitle_text].compact.join(' ')

      CGI.unescapeHTML(full_text)
    end

    def album_artist_data(album)
      { name: album_artist_name(album) }
    end

    def album_artist_name(album)
      artist_name =
        album['authorName'].match(%r{<a.+>(.+)</a>}).to_a[1]

      if artist_name.present?
        CGI.unescapeHTML(artist_name)
      else
        'Various Artists'
      end
    end

    def track_id(track)
      super(track_artist_name(track), track_title(track))
    end

    def track_artist_data(track)
      { name: track_artist_name(track) }
    end

    def track_artist_name(track)
      CGI.unescapeHTML(track[4])
    end

    def track_title(track)
      full_title(track[3], track[16])
    end

    def image_data(image, model)
      VK::Utils::Image.call(image: image, model: model)
    end

    def audio_id(track)
      hashes = track[13].split('/')

      "#{track[1]}_#{track[0]}_#{hashes[2]}_#{hashes[5]}"
    end
  end
end
