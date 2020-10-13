module LastFM
  class API < LastFM::Base
    def call
      super
    rescue RestClient::BadRequest
      bad_request_error
    end

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
      %w[base model extra].map do |scope|
        send("#{scope}_params")
      end.reduce(:merge).compact
    end

    def base_params
      {
        method: service_info[:api_method],
        api_key: api_key,
        format: 'json',
        autocorrect: 1
      }
    end

    def api_key
      secrets.lastfm.dig(:api_key, Rails.env.to_sym)
    end

    def model_params
      @args.to_h.slice(:artist, :album, :track)
    end

    def extra_params
      @args.to_h.slice(:tag, :page).merge(limit: limit)
    end

    def limit
      @args.limit || 50
    end

    def data_node
      service_info[:response_data_node]
    end
  end
end
