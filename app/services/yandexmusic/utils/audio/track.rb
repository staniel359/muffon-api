module YandexMusic
  module Utils
    module Audio
      class Track < YandexMusic::Base
        # rubocop:disable Layout/LineLength
        COOKIE =
          'Session_id=3:1720883025.5.0.1720883025049:qKU3wg:a1.1.2:1|1069814265.0.2.3:1720883025|3:10291445.185369.Pjop4a1rkrxTzCxZdnrnFe5ZcFM'.freeze
        # rubocop:enable Layout/LineLength

        def call
          return if not_all_args?

          data
        end

        private

        def primary_args
          [@args[:track_id]]
        end

        def data
          response_data
        rescue Faraday::ForbiddenError
          nil
        end

        def link
          'https://music.yandex.ru/api/v2.1' \
            "/handlers/track/#{@args[:track_id]}" \
            '/web-album_track-track-track-main' \
            '/download/m'
        end

        def params
          nil
        end

        def headers
          {
            'X-Retpath-Y' =>
              'https%3A%2F%2Fmusic.yandex.ru/',
            'Cookie' => COOKIE,
            'User-Agent' => USER_AGENT
          }
        end
      end
    end
  end
end
