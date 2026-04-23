module YouTube
  class Playlists < YouTube::Base
    def call
      check_args

      data
    rescue Faraday::ResourceNotFound
      raise not_found_error
    end

    private

    def required_args
      %i[
        channel_id
      ]
    end

    def data
      paginated_data(
        collection_name: 'playlists',
        raw_collection:,
        page:,
        limit:,
        is_infinite: true,
        previous_page:,
        next_page:
      )
    end

    def raw_collection
      response_data['items'] || []
    end

    def link
      "#{BASE_LINK}/playlists"
    end

    def params
      {
        **super,
        channelId: @args[:channel_id],
        part: 'id,snippet,contentDetails',
        maxResults: limit,
        pageToken: @args[:page]
      }
    end

    def previous_page
      response_data['prevPageToken']
    end

    def next_page
      response_data['nextPageToken']
    end

    def collection_item_data_formatted(
      raw_video_playlist_data
    )
      YouTube::Playlists::Playlist.call(
        raw_video_playlist_data:,
        **self_args
      )
    end
  end
end
