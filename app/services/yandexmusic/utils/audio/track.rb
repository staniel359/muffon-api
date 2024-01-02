module YandexMusic
  module Utils
    module Audio
      class Track < YandexMusic::Base
        # rubocop:disable Layout/LineLength
        COOKIE =
          '_yasc=Hpc5CkJW9g6nePYBlmzL7A8EJgKnz8loJUVqp8X6FhiHxFyPWXAalI+/ZxHp3/BWyqN+PmgAKPM3; spravka=dD0xNzA0MjAwODIwO2k9MTk0LjU1LjE2NS4xNjg7RD04OUMyMkU0N0Q4OEYyRjYyQUQwMkY0MkYwQjA5MzBBQzVFOERFNkQzNTIzMzRFNjYwMzBDN0E5RjUxNjk5M0E2REZBNjE2OTk5MkIzMjNDNjAxMENCQjlEQzVDNjRFRTg3MjI3Mjg4ODYxRTY4NDEyNUU4QUI3ODFFQjI3RUYzRjE1MDRDN0QwMUJGRTkxQTRCQkIwMUE2RjgzNTk3N0U0QzlBRjczNDNBNjk0ODU3Qzg2RDM4QTc0O3U9MTcwNDIwMDgyMDgyMjY4NDQ1MTtoPTMxYjdmMmE5NTEwOTE4ZDgxMzAwYTNlZTI4NjM0YmNk; i=zl4Jbiy1YU1N86kJO//O6TgXLAoIIaZQQFaole1zuChvEtW52JEO…5.809548.SSNhVLQxBs8SrdpJooxLrn7Lafo; sessar=1.1185.CiBnEUBTkKFKVlmS-tDFgZuGvgCHk0bU0vVgCbvcO6Kf8g.LK_JCEBR_rjBj3_QFfel79qf717u7MilbIggB0WNi58; sessionid2=3:1704205980.5.0.1704205980223:CMGssg:cc.1.2:1|1069814265.0.2.3:1704205980|3:10281025.809548.fakesign0000000000000000000; lastVisitedPage=%7B%221069814265%22%3A%22%2Fartist%2F777542%22%7D; fullscreen-saved-data=%7B%22minusoviki_fullscreen_4_music-1%22%3A%7B%22compositeId%22%3A%22minusoviki_fullscreen_4_music-1%22%2C%22actualUntil%22%3A1735828393121%7D%7D'.freeze
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
            'Referer' => 'https://music.yandex.ru',
            'Host' => 'music.yandex.ru',
            'User-Agent' => USER_AGENT,
            'Origin' => 'https://music.yandex.ru'
          }
        end
      end
    end
  end
end
