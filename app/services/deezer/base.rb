module Deezer
  class Base < Muffon::Base
    BASE_LINK =
      'https://www.deezer.com/ajax/gw-light.php'.freeze
    SOURCE_NAME = 'deezer'.freeze

    private

    def link
      BASE_LINK
    end

    def payload
      {}
    end

    def params
      {
        method: api_method,
        api_version: '1.0',
        api_token:
      }
    end

    def api_method
      self.class::API_METHOD
    end

    def api_token
      user_tokens[:api_token]
    end

    def user_tokens
      @user_tokens ||=
        Deezer::Utils::Token::User.call
    end

    def cookies
      { sid: session_id }
    end

    def session_id
      secrets.deezer[:session_id]
    end

    def image_data_formatted(image_id, model)
      Deezer::Utils::Image.call(
        image_id:, model:
      )
    end

    def artist_data_formatted(artist)
      {
        source:
          artist_source_data(artist),
        name: artist['ART_NAME']
      }
    end

    def artist_source_data(artist)
      {
        name: source_name,
        id: artist['ART_ID'].to_i
      }
    end

    alias response post_response
    alias artist_name artists_names
  end
end
