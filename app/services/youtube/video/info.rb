module YouTube
  module Video
    class Info < YouTube::Video::Base
      include YouTube::Mixins::Video

      private

      def params
        {
          **super,
          id: @args[:video_id],
          part: 'snippet,statistics'
        }
      end

      def video_data
        update_record_data!

        Muffon::Formatter::Source::Video::Info.call(
          source_original_link:,
          source_name:,
          source_video_id: youtube_id,
          title:,
          channel_title:,
          source_video_channel_id: channel_youtube_id,
          image_data:,
          artist_data: artist_info_data,
          views_count:,
          likes_count:,
          dislikes_count:,
          creation_date:,
          description:,
          description_size: 'medium',
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
