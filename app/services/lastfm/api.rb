module LastFM
  class API < Muffon::Base
    def call
      return bad_request_error if primary_args.any?(&:blank?)
      return not_found_error if no_data?

      data
    rescue RestClient::BadRequest
      bad_request_error
    end

    private

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

    def args_params
      {
        artist: @args.artist,
        album: @args.album,
        track: @args.track,
        tag: @args.tag,
        page: @args.page,
        limit: @args.limit || 50
      }.compact
    end

    def api_key
      secrets.lastfm.dig(:api_key, Rails.env.to_sym)
    end
  end
end
