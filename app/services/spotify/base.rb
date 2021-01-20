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

    def base_link
      'https://api.spotify.com/v1'
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
      {}
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

    def artist_name(data)
      data['artists'].map { |a| a['name'] }.join(', ')
    end

    def images(data, model)
      if images_list(data).present?
        images_data(data)
      else
        default_images_data(model)
      end
    end

    def images_list(data)
      data['images']
    end

    def images_data(data)
      {
        original: image_data(data, 0),
        large: image_data(data, -3),
        medium: image_data(data, -2),
        small: image_data(data, -1),
        extrasmall: image_data(data, -1)
      }
    end

    def image_data(data, index)
      images_list(data).dig(index, 'url')
    end

    def length(track)
      track['duration_ms'].fdiv(1000).ceil
    end

    def audio_data(track)
      {
        present: track['id'].present?,
        id: track['id'],
        source: 'spotify'
      }
    end
  end
end
