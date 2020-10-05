module LastFM
  class Base < Muffon::Base
    private

    def api_response(method)
      RestClient.get(
        api_link, params: base_params(method)
      )
    end

    def api_link
      'http://ws.audioscrobbler.com/2.0'
    end

    def base_params(method)
      {
        method: method,
        api_key: api_key,
        format: 'json',
        autocorrect: 1,
        artist: @args.artist_name,
        album: @args.album_title,
        page: @args.page,
        limit: @args.limit || 50
      }
    end

    def api_key
      secrets.lastfm[:api_key][Rails.env.to_sym]
    end

    def not_found_data
      { error: 'Not found.' }
    end
  end
end
