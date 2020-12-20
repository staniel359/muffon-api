module YouTube
  class Search < YouTube::Base
    private

    def results
      response_data['items']
    end

    def data
      {
        search: {
          next_page: response_data['nextPageToken'],
          videos: videos
        }
      }
    end

    def videos
      results.map do |r|
        {
          title: r.dig('snippet', 'title'),
          description: r.dig('snippet', 'description'),
          preview: r.dig('snippet', 'thumbnails', 'medium', 'url'),
          video_id: r.dig('id', 'videoId')
        }
      end
    end
  end
end
