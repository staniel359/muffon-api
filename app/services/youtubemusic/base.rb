module YouTubeMusic
  class Base < Muffon::Base
    SOURCE_NAME = 'youtubemusic'.freeze
    BASE_LINK =
      'https://music.youtube.com/youtubei/v1/search'.freeze

    private

    def context_data
      { client: client_data }
    end

    def client_data
      {
        clientName: 'WEB_REMIX',
        clientVersion: '1.20230227.01.00',
        gl: 'GB'
      }
    end

    def headers
      { content_type: :json }
    end

    def image_data_formatted(image)
      YouTubeMusic::Utils::Image.call(
        image:
      )
    end
  end
end
