module YouTube
  module Playlist
    class Videos < YouTube::Playlist::Base
      private

      def not_found?
        playlist_info_data.blank?
      end

      def playlist_info_data
        @playlist_info_data ||=
          YouTube::Playlist::Info.call(
            playlist_id: @args[:playlist_id]
          )[:playlist]
      end

      def playlist_data
        {
          **playlist_info_data.slice(
            :source,
            :title,
            :channel
          ),
          **videos_data
        }
      end

      def videos_data
        paginated_data(
          collection_name: 'videos',
          raw_collection:,
          page:,
          limit:,
          is_infinite: true,
          previous_page:,
          next_page:
        )
      end

      def raw_collection
        response_data['items']
      end

      def link
        "#{BASE_LINK}/playlistItems"
      end

      def params
        {
          **super,
          playlistId: @args[:playlist_id],
          part: 'snippet',
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
        raw_video_data
      )
        YouTube::Playlist::Videos::Video.call(
          raw_video_data:,
          **self_args
        )
      end
    end
  end
end
