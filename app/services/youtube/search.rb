module YouTube
  class Search < Muffon::Base
    def call
      return errors.bad_request if not_all_args?
      return errors.not_found if no_data?

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
      @results_data ||= response_data['items']
    end

    def response_data
      @response_data ||= JSON.parse(response)
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
        key: secrets.youtube[:api_key],
        q: @args.query,
        maxResults: limit,
        pageToken: @args.next_page
      }
    end

    def limit
      @args.limit || 20
    end

    def data
      { search: search_data }
    end

    def search_data
      {
        next_page: response_data['nextPageToken'],
        results: results
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
