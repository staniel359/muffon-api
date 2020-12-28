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
      response_data[0].to_i
    end

    def response_data
      @response_data ||=
        JSON.parse(response_to_json)['payload']
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

    def album_title(album)
      title = album['title'] || album[:title]
      subtitle = album['subTitle'] || album[:subtitle]

      full_title(title, subtitle)
    end

    def full_title(title, subtitle)
      return CGI.unescapeHTML(title) if subtitle.blank?

      CGI.unescapeHTML("#{title} (#{subtitle})")
    end

    def album_artist_name(album)
      CGI.unescapeHTML(
        album['authorName'].match(%r{<a.+>(.+)</a>})[1]
      )
    end

    def track_id(track)
      super(track_artist_name(track), track_title(track))
    end

    def track_artist_name(track)
      CGI.unescapeHTML(track[4])
    end

    def track_title(track)
      full_title(track[3], track[16])
    end

    def audio_id(track)
      hashes = track[13].split('/')

      "#{track[1]}_#{track[0]}_#{hashes[2]}_#{hashes[5]}"
    end
  end
end
