module YouTube
  module Playlist
    class Videos < YouTube::Playlist::Base
      private

      def no_data?
        playlist_info_data.blank?
      end

      def playlist_info_data
        @playlist_info_data ||=
          YouTube::Playlist::Info.call(
            playlist_id: @args[:playlist_id]
          )[:playlist]
      end

      def link
        "#{BASE_LINK}/playlistItems"
      end

      def playlist_params
        {
          playlistId: @args[:playlist_id],
          part: 'snippet',
          maxResults: limit,
          pageToken: @args[:page]
        }
      end

      def playlist_data
        playlist_base_data
          .merge(playlist_videos_data)
      end

      def playlist_base_data
        playlist_info_data.slice(
          *%i[source title channel]
        )
      end

      def playlist_videos_data
        {
          prev_page:,
          next_page:,
          videos:
        }.compact
      end

      def video_data_formatted(video)
        YouTube::Playlist::Videos::Video.call(
          video:
        )
      end
    end
  end
end
