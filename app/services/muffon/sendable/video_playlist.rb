module Muffon
  module Sendable
    class VideoPlaylist < Muffon::Base
      def call
        check_args

        data
      end

      private

      def required_args
        %i[
          raw_video_playlist_data
        ]
      end

      def data
        {
          source: source_data,
          title:,
          channel: video_channel_data,
          description:,
          image: image_data,
          videos_count:,
          publish_date: creation_date
        }.compact
      end

      def source_data
        video_playlist_record.source_data
      end

      def video_playlist_record
        if defined?(@video_playlist_record)
          @video_playlist_record
        else
          @video_playlist_record =
            ::VideoPlaylist.find_by(
              youtube_id:
            )
        end
      end

      def youtube_id
        video_playlist_data[:youtube_id]
      end

      def video_playlist_data
        @args[:raw_video_playlist_data].deep_symbolize_keys
      end

      def title
        video_playlist_record.title
      end

      def video_channel_data
        video_playlist_record.video_channel_data
      end

      def description
        video_playlist_record
          .description
          .presence
      end

      def image_data
        video_playlist_record.image_data
      end

      def videos_count
        video_playlist_record.videos_count
      end

      def creation_date
        datetime_formatted(
          raw_creation_date
        )
      end

      def raw_creation_date
        video_playlist_record.created_at
      end
    end
  end
end
