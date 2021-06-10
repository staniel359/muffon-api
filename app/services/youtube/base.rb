module YouTube
  class Base < Muffon::Base
    BASE_LINK =
      'https://www.googleapis.com/youtube/v3'.freeze

    private

    def no_data?
      response_data.blank?
    end

    def response_data
      @response_data ||= JSON.parse(response)
    end

    def response
      RestClient.get(link, headers)
    end

    def headers
      { params: params }
    end

    def params
      { key: api_key }
    end

    def api_key
      secrets.youtube[:api_key]
    end

    def videos
      videos_list.map do |v|
        video_data_formatted(v)
      end
    end

    def videos_list
      @videos_list ||= response_data['items']
    end
  end
end
