module YouTube
  module Playlist
    class Info < YouTube::Playlist::Base
      private

      def no_data?
        playlist.blank?
      end

      def playlist_data
        self_data
          .merge(playlist_base_data)
          .merge(playlist_extra_data)
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
    end
  end
end
