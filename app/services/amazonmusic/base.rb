module AmazonMusic
  class Base < Muffon::Base
    SOURCE_NAME = 'amazonmusic'.freeze
    BASE_LINK = 'https://eu.mesk.skill.music.a2z.com/api'.freeze
    DEVICE_ID = '25814726589747619'.freeze
    DEVICE_TYPE_ID = 'A16ZV8BU3SN1N3'.freeze

    include Muffon::Mixins::GlobalStorage

    private

    def amazonmusic_token
      return test_token if test?

      @amazonmusic_token ||=
        get_global_value(
          'amazonmusic:token',
          expires_in_seconds: 3600,
          refresh_class_name: 'AmazonMusic::Utils::Token'
        )
    end

    def test_token
      credentials.dig(
        :amazon_music,
        :token
      )
    end

    def next_page
      return if next_page_url.blank?

      parse_query_string(
        link: next_page_url
      )['next']
    end

    def next_page_url
      response_data.dig(
        'methods',
        0,
        'template',
        'widgets',
        0,
        'onEndOfWidget',
        0,
        'url'
      ) ||
        response_data.dig(
          'methods',
          0,
          'onEndOfWidget',
          0,
          'url'
        )
    end
  end
end
