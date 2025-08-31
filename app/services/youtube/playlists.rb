module YouTube
  class Playlists < YouTube::Base
    COLLECTION_NAME = 'playlists'.freeze

    include YouTube::Utils::Pagination

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

    def collection_item_data_formatted(playlist)
      YouTube::Playlists::Playlist.call(
        playlist:,
        profile_id: @args[:profile_id],
        token: @args[:token]
      )
    end

    alias data paginated_data
    alias collection_list items_list
  end
end
