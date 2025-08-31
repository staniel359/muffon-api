module AmazonMusic
  class Base < Muffon::Base
    SOURCE_NAME = 'amazonmusic'.freeze
    BASE_LINK =
      'https://eu.mesk.skill.music.a2z.com/api'.freeze
    DEVICE_ID = '25814726589747619'.freeze
    DEVICE_TYPE_ID = 'A16ZV8BU3SN1N3'.freeze

    private

    def amazonmusic_token
      return test_token if test?

      get_global_value(
        'amazonmusic:token',
        expires_in_seconds: 3600,
        refresh_class_name:
          'AmazonMusic::Utils::Token'
      )
    end

    def test_token
      credentials.dig(
        :amazon_music,
        :token
      )
    end

    def image_data_formatted(image_link)
      AmazonMusic::Utils::Image.call(
        image_link:
      )
    end

    def artist_data_formatted(artist)
      {
        source: artist_source_data(artist),
        name: artist['name']
      }
    end

    def artist_source_data(artist)
      {
        name: source_name,
        id: artist['id']
      }
    end

    def headers
      { 'User-Agent' => USER_AGENT }
    end
  end
end
