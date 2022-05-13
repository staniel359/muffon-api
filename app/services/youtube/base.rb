module YouTube
  class Base < Muffon::Base
    SOURCE_NAME = 'youtube'.freeze
    BASE_LINK =
      'https://www.googleapis.com/youtube/v3'.freeze

    private

    def no_data?
      response_data.blank?
    end

    def params
      { key: api_key }
    end

    def api_key
      secrets.google[:api_key]
    end

    def videos
      videos_list.map do |v|
        video_data_formatted(v)
      end
    end

    def videos_list
      response_data['items']
    end
  end
end
