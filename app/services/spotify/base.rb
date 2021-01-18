module Spotify
  class Base < Muffon::Base
    def call
      return handlers.bad_request if not_all_args?
      return handlers.not_found if no_data?

      data
    rescue RestClient::Unauthorized
      retry_with_new_spotify_token
    end

    private

    def response_data
      @response_data ||= JSON.parse(response)
    end

    def response
      RestClient.get(link, headers)
    end

    def headers
      {
        'Authorization' => "Bearer #{spotify_token}",
        params: params
      }
    end

    def spotify_token
      global.get('spotify_token')
    end

    def params
      base_params.merge(extra_params).compact
    end

    def base_params
      { q: @args.query, limit: limit, offset: offset }
    end

    def limit
      (@args.limit || 20).to_i
    end

    def offset
      (page - 1) * limit
    end

    def page
      (@args.page || 1).to_i
    end

    def extra_params
      {}
    end

    def total_pages
      total_items.fdiv(limit).ceil
    end

    def retry_with_new_spotify_token
      global.set('spotify_token', new_spotify_token)
      call
    end

    def new_spotify_token
      Spotify::Token.call
    end
  end
end
