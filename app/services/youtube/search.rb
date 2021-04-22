module YouTube
  class Search < YouTube::Base
    private

    def results
      response_data['items']
    end

    def data
      { search: search_data }
    end

    def search_data
      {
        next_page: response_data['nextPageToken'],
        results: results_data
      }
    end

    def results_data
      results.map { |r| result_data(r) }
    end

    def result_data(result)
      {
        title: title(result),
        channel: channel_data(result),
        image: image_data(result),
        published: published(result),
        description: description(result),
        video: video_data(result)
      }
    end

    def title(result)
      CGI.unescapeHTML(result.dig('snippet', 'title'))
    end

    def channel_data(result)
      {
        id: result.dig('snippet', 'channelId'),
        title: result.dig('snippet', 'channelTitle')
      }
    end

    def image_data(result)
      {
        large: image(result, 'high'),
        medium: image(result, 'medium'),
        small: image(result, 'default')
      }
    end

    def image(result, size)
      result.dig('snippet', 'thumbnails', size, 'url')
    end

    def published(result)
      time_formatted(result.dig('snippet', 'publishedAt'))
    end

    def description(result)
      CGI.unescapeHTML(result.dig('snippet', 'description'))
    end

    def video_data(result)
      { id: result.dig('id', 'videoId') }
    end
  end
end
