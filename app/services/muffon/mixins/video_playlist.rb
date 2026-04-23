module Muffon
  module Mixins
    module VideoPlaylist
      private

      def video_playlist_record
        @video_playlist_record ||=
          ::VideoPlaylist.with_youtube_id(
            youtube_id:,
            title:,
            channel_title:
          )
      end

      def self_data
        Muffon::Utils::Self.call(
          **self_args,
          model: 'video_playlist',
          model_id: video_playlist_record.id
        )
      end
    end
  end
end
