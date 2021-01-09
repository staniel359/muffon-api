module LastFM
  class API < LastFM::Base
    private

    def no_data?
      response_data.blank?
    end

    def response_data
      @response_data ||=
        JSON.parse(api_response)[data_node]
    end

    def api_response
      RestClient.get(api_link, params: params)
    end

    def api_link
      'http://ws.audioscrobbler.com/2.0'
    end

    def params
      [
        base_params, model_params, extra_params
      ].reduce(:merge).compact
    end

    def base_params
      {
        method: service_info[:api_method],
        api_key: secrets.lastfm[:api_key],
        format: 'json',
        autocorrect: 1
      }
    end

    def model_params
      {
        artist: format_param(@args.artist),
        album: format_param(@args.album),
        track: format_param(@args.track)
      }
    end

    def format_param(param)
      param.to_s.strip.presence
    end

    def extra_params
      {
        tag: format_param(@args.tag),
        page: @args.page,
        limit: limit
      }
    end

    def limit
      (@args.limit || 50).to_i
    end

    def data_node
      service_info[:response_data_node]
    end

    def description
      return '' if description_data.blank?

      description_data.match(description_regexp)[1].strip
    end

    def description_data
      response_data.dig('bio', 'content') ||
        response_data.dig('wiki', 'content')
    end

    def description_regexp
      %r{(.+)<a href="http(s?)://www.last.fm}m
    end
  end
end
