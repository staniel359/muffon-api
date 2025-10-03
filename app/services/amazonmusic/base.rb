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

      @amazonmusic_token ||=
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

    def artist_data_formatted(
      raw_artist_data
    )
      {
        source: artist_source_data(
          raw_artist_data
        ),
        name: raw_artist_data['name']
      }
    end

    def artist_source_data(
      raw_artist_data
    )
      {
        name: source_name,
        id: raw_artist_data['id']
      }
    end
  end
end
