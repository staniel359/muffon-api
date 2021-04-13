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
        title: result.dig('snippet', 'title'),
        channel: channel_data(result),
        image: image_data(result),
        published: published(result),
        description: result.dig('snippet', 'description'),
        video: video_data(result)
      }
    end

    def published(result)
      time_formatted(result.dig('snippet', 'publishedAt'))
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

    def video_data(result)
      { id: result.dig('id', 'videoId') }
    end
  end
end
