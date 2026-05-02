module YouTube
  module Video
    class Info < YouTube::Video::Base
      include YouTube::Mixins::Video

      private

      def request_params
        {
          **super,
          id: @args[:video_id],
          part: 'snippet,statistics'
        }
      end

      def video_data
        update_video_record!

        Muffon::Formatter::Source::Video::Info.call(
          video_record:,
          artist_data: artist_info_data,
          likes_count:,
          dislikes_count:,
          description:,
          tags:,
          tags_size: 'extrasmall',
          **self_args
        )
      end

      def artist_info_data
        Muffon::Formatter::Source::Video::Artist.call(
          channel_title:,
          **self_args
        )
      end
    end
  end
end
