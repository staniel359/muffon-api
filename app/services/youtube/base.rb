module YouTube
  class Base < Muffon::Base
    include Muffon::Paginated

    def call
      return handlers.bad_request if not_all_args?
      return handlers.not_found if no_data?

      data
    end

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

    def headers
      { params: params }
    end

    def link
      'https://www.googleapis.com/youtube/v3/search'
    end

    def params
      {
        part: 'snippet',
        type: 'video',
        key: secrets.youtube[:api_key],
        q: @args.query,
        maxResults: limit,
        pageToken: @args.next_page
      }.compact
    end
  end
end
