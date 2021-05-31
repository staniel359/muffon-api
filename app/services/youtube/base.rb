module YouTube
  class Base < Muffon::Base
    BASE_LINK =
      'https://www.googleapis.com'\
      '/youtube/v3/search'.freeze
    include Muffon::Utils::Pagination

    private

    def primary_args
      [@args.query]
    end

    def response_data
      @response_data ||= JSON.parse(response)
    end

    def response
      RestClient.get(link, headers)
    end

    def link
      BASE_LINK
    end

    def headers
      { params: params }
    end

    def params
      {
        key: api_key,
        q: @args.query,
        part: 'snippet',
        type: 'video',
        maxResults: limit,
        pageToken: @args.next_page
      }.compact
    end

    def api_key
      secrets.youtube[:api_key]
    end
  end
end
