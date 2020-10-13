module YouTube
  class Search < Muffon::Base
    def call
      return bad_request_error if not_all_args?
      return not_found_error if no_data?

      data
    end

    private

    def primary_args
      [@args.query]
    end

    def no_data?
      results_data.blank?
    end

    def results_data
      @results_data ||= parsed_response['items']
    end

    def parsed_response
      @parsed_response ||= JSON.parse(response)
    end

    def response
      RestClient.get(youtube_link, params: params)
    end

    def youtube_link
      'https://www.googleapis.com/youtube/v3/search'
    end

    def params
      {
        part: 'snippet',
        type: 'video',
        key: api_key,
        q: @args.query,
        maxResults: limit,
        pageToken: @args.next_page
      }
    end

    def api_key
      secrets.dig(:youtube, :api_key, Rails.env.to_sym)
    end

    def limit
      @args.limit || 20
    end

    def data
      { search: search_data }
    end

    def search_data
      {
        results: results,
        next_page: parsed_response['nextPageToken']
      }
    end

    def results
      results_data.map do |r|
        {
          title: r.dig('snippet', 'title'),
          description: r.dig('snippet', 'description'),
          preview: r.dig('snippet', 'thumbnails', 'high', 'url'),
          video_id: r.dig('id', 'videoId')
        }
      end
    end
  end
end
