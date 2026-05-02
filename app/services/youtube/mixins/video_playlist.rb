module YouTube
  module Mixins
    module VideoPlaylist
      include Muffon::Mixins::VideoPlaylist

      private

      def title
        if raw_title.present?
          CGI.unescapeHTML(
            raw_title
          )
        else
          'Untitled'
        end
      end

      def raw_title
        raw_video_playlist_data.dig(
          'snippet',
          'title'
        )
      end

      def youtube_id
        raw_video_playlist_data['id']
      end

      def channel_youtube_id
        raw_video_playlist_data.dig(
          'snippet',
          'channelId'
        )
      end

      def channel_title
        if channel_youtube_id == 'UC'
          'YouTube Music'
        else
          CGI.unescapeHTML(
            raw_channel_title
          )
        end
      end

      def raw_channel_title
        raw_video_playlist_data.dig(
          'snippet',
          'channelTitle'
        )
      end

      def image_url
        raw_video_playlist_data.dig(
          'snippet',
          'thumbnails',
          'default',
          'url'
        )
      end

      def description
        return if raw_description.blank?

        CGI.unescapeHTML(
          raw_description
        )
      end

      def raw_description
        raw_video_playlist_data.dig(
          'snippet',
          'description'
        )
      end

      def videos_count
        return if raw_videos_count.blank?

        raw_videos_count.to_i
      end

      def raw_videos_count
        raw_video_playlist_data.dig(
          'contentDetails',
          'itemCount'
        )
      end

      def publish_date
        datetime_formatted(
          raw_publish_date.to_datetime
        )
      end

      def raw_publish_date
        raw_video_playlist_data.dig(
          'snippet',
          'publishedAt'
        )
      end

      def update_video_playlist_record!
        video_playlist_record.update!(
          video_playlist_record_attributes
        )
      end

      def video_playlist_record_attributes
        {
          title:,
          channel_youtube_id:,
          channel_title:,
          image_url:,
          videos_count:,
          description:,
          publish_date:
        }.compact
      end
    end
  end
end
