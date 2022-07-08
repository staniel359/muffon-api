module YouTube
  class Base < Muffon::Base
    SOURCE_NAME = 'youtube'.freeze
    BASE_LINK =
      'https://www.googleapis.com/youtube/v3'.freeze

    private

    def no_data?
      response_data.blank? ||
        items_list.blank?
    end

    def items_list
      response_data['items']
    end

    def params
      { key: api_key }
    end

    def api_key
      secrets.google[:api_key]
    end

    def videos
      items_list.map do |v|
        video_data_formatted(v)
      end
    end

    def image_data_formatted(image)
      YouTube::Utils::Image.call(
        image:
      )
    end
  end
end
