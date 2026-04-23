module YouTube
  module Playlist
    class Info < YouTube::Playlist::Base
      include YouTube::Mixins::VideoPlaylist

      private

      def params
        {
          **super,
          id: @args[:playlist_id],
          part: 'snippet,contentDetails'
        }
      end

      def playlist_data
        update_record_data!

        Muffon::Formatter::User::VideoPlaylist::Info.call(
          source_original_link:,
          source_name:,
          source_video_playlist_id: youtube_id,
          title:,
          channel_title:,
          source_video_channel_id: channel_youtube_id,
          image_data:,
          description:,
          description_size: 'medium',
          videos_count:,
          creation_date:,
          **self_args
        )
      end
    end
  end
end
