module YouTube
  module Playlist
    class Base < YouTube::Base
      include YouTube::Utils::Playlist
      include YouTube::Utils::Pagination

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
        playlist.blank?
      end

      def playlist
        items_list[0]
      end

      def link
        "#{BASE_LINK}/playlists"
      end

      def params
        {
          **super,
          **playlist_params
        }
      end

      def playlist_params
        {
          id: @args[:playlist_id],
          part: 'snippet,contentDetails'
        }
      end

      def data
        { playlist: playlist_data }
      end

      def playlist_data
        {
          source: source_data,
          title:,
          channel: channel_data
        }.compact
      end
    end
  end
end
