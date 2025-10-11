module Muffon
  module Utils
    module VideoPlaylist
      private

      def find_video_playlist
        @find_video_playlist ||=
          ::VideoPlaylist.with_youtube_id(
            youtube_id:,
            update_attributes:
          )
      end

      def youtube_id
        @args[:youtube_id]
      end

      def update_attributes
        {
          title:,
          channel_youtube_id:,
          channel_title:,
          description:,
          videos_count:,
          image_url: image,
          created_at: publish_date
        }.compact
      end

      def title
        nil
      end

      def channel_youtube_id
        nil
      end

      def channel_title
        nil
      end

      def description
        nil
      end

      def videos_count
        nil
      end

      def image
        nil
      end

      def publish_date
        nil
      end

      def self_data
        Muffon::Self.call(
          profile_id: @args[:profile_id],
          token: @args[:token],
          model: 'video_playlist',
          model_id: video_playlist_id
        )
      end

      def video_playlist_id
        find_video_playlist.id
      end
    end
  end
end
