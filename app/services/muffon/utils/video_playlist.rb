module Muffon
  module Utils
    module VideoPlaylist
      private

      def find_video_playlist
        @find_video_playlist ||=
          ::VideoPlaylist.where(
            youtube_id:
          ).first_or_initialize.tap do |v|
            v.attributes = update_params

            v.save
          end
      end

      def youtube_id
        @args[:youtube_id]
      end

      def update_params
        {
          title:,
          channel_youtube_id:,
          channel_title:,
          image_url: image,
          videos_count:,
          publish_date:
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

      def image
        nil
      end

      def videos_count
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
