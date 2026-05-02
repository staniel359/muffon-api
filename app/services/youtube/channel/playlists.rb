module YouTube
  module Channel
    class Playlists < YouTube::Channel::Base
      include YouTube::Mixins::VideoChannel

      private

      def request_params
        {
          **super,
          id: @args[:channel_id],
          part: 'snippet,contentDetails,statistics'
        }
      end

      def channel_data
        Muffon::Formatter::Source::VideoChannel::Playlists.call(
          video_channel_record:,
          prev_page:,
          next_page:,
          playlists:
        )
      end

      def prev_page
        playlists_data[:prev_page]
      end

      def playlists_data
        @playlists_data ||=
          YouTube::Playlists.call(
            channel_id: @args[:channel_id],
            limit:,
            page: @args[:page],
            **self_args
          )
      end

      def next_page
        playlists_data[:next_page]
      end

      def playlists
        playlists_data[:playlists]
      end
    end
  end
end
