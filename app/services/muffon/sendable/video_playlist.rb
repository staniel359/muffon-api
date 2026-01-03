module Muffon
  module Sendable
    class VideoPlaylist < YouTube::Base
      include YouTube::Utils::Playlist

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
        find_video_playlist.title
      end

      def find_video_playlist
        if instance_variable_defined?(
          :@find_video_playlist
        )
          @find_video_playlist
        else
          @find_video_playlist =
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
        find_video_playlist.channel_youtube_id
      end

      def channel_title
        find_video_playlist.channel_title
      end

      def description
        find_video_playlist
          .description
          .presence
      end

      def image_data
        image_data_formatted(
          image:
        )
      end

      def image
        find_video_playlist.image_url
      end

      def videos_count
        find_video_playlist.videos_count
      end

      def raw_publish_date
        find_video_playlist
          .created_at
          .to_s
      end
    end
  end
end
