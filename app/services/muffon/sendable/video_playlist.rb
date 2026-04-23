module Muffon
  module Sendable
    class VideoPlaylist < YouTube::Base
      include YouTube::Mixins::VideoPlaylist

      def call
        check_args

        data
      end

      private

      def required_args
        %i[
          playlist
        ]
      end

      def data
        {
          source: source_data,
          title:,
          channel: channel_data,
          description:,
          image: image_data,
          videos_count:,
          publish_date:
        }.compact
      end

      def title
        video_playlist_record.title
      end

      def video_playlist_record
        if instance_variable_defined?(
          :@video_playlist_record
        )
          @video_playlist_record
        else
          @video_playlist_record =
            ::VideoPlaylist.find_by(
              youtube_id:
            )
        end
      end

      def youtube_id
        playlist['youtube_id']
      end

      def playlist
        @args[:playlist]
      end

      def channel_youtube_id
        video_playlist_record.channel_youtube_id
      end

      def channel_title
        video_playlist_record.channel_title
      end

      def description
        video_playlist_record
          .description
          .presence
      end

      def image_data
        image_data_formatted(
          image:
        )
      end

      def image
        video_playlist_record.image_url
      end

      def videos_count
        video_playlist_record.videos_count
      end

      def raw_publish_date
        video_playlist_record
          .created_at
          .to_s
      end
    end
  end
end
