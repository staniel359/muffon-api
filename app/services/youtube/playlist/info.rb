module YouTube
  module Playlist
    class Info < YouTube::Playlist::Base
      private

      def playlist_data
        self_data
          .merge(super)
          .merge(playlist_extra_data)
          .merge(with_more_data)
      end

      def playlist_extra_data
        {
          image: image_data,
          description:
            description_truncated,
          videos_count:,
          publish_date:
        }.compact
      end

      def description_truncated
        text_truncated(
          description,
          size: 'medium'
        )
      end
    end
  end
end
