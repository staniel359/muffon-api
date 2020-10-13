module LastFM
  class API < LastFM::Base
    def call
      super
    rescue RestClient::BadRequest
      bad_request_error
    end

    private

    def primary_args
      []
    end

    def no_data?
      parsed_response.blank?
    end

    def api_response(method)
      RestClient.get(api_link, params: params(method))
    end

    def api_link
      'http://ws.audioscrobbler.com/2.0'
    end

    def params(method)
      base_params(method).merge(args_params)
    end

    def base_params(method)
      {
        method: method,
        api_key: api_key,
        format: 'json',
        autocorrect: 1
      }
    end

    def api_key
      secrets.lastfm.dig(:api_key, Rails.env.to_sym)
    end

    def args_params
      {
        artist: artist_query,
        album: album_query,
        track: track_query,
        tag: @args.tag,
        page: @args.page,
        limit: limit
      }.compact
    end

    def artist_query
      @args.artist
    end

    def album_query
      @args.album
    end

    def track_query
      @args.track
    end

    def limit
      @args.limit || 50
    end
  end
end
