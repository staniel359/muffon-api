module YouTube
  module Channel
    class Videos < YouTube::Channel::Base
      include YouTube::Mixins::VideoChannel

      private

      def params
        {
          **super,
          id: @args[:channel_id],
          part: 'snippet,contentDetails,statistics'
        }
      end

      def channel_data
        Muffon::Formatter::Source::VideoChannel::Videos.call(
          source_original_link:,
          source_name:,
          source_video_channel_id: youtube_id,
          title:,
          prev_page:,
          next_page:,
          videos:
        )
      end

      def prev_page
        uploads_playlist_data[:prev_page]
      end

      def uploads_playlist_data
        @uploads_playlist_data ||=
          YouTube::Playlist::Videos.call(
            playlist_id: uploads_playlist_id,
            limit:,
            page: @args[:page],
            **self_args
          )[:playlist] || {}
      end

      def uploads_playlist_id
        raw_video_channel_data.dig(
          'contentDetails',
          'relatedPlaylists',
          'uploads'
        )
      end

      def next_page
        uploads_playlist_data[:next_page]
      end

      def videos
        uploads_playlist_data[:videos] || []
      end
    end
  end
end
