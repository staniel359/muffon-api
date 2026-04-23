module YouTube
  module Playlist
    class Base < YouTube::Base
      def call
        check_args

        check_if_not_found

        data
      end

      private

      def required_args
        %i[
          playlist_id
        ]
      end

      def not_found?
        raw_video_playlist_data.blank?
      end

      def raw_video_playlist_data
        response_data.dig('items', 0)
      end

      def link
        "#{BASE_LINK}/playlists"
      end

      def data
        { playlist: playlist_data }
      end
    end
  end
end
