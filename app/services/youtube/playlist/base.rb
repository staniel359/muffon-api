module YouTube
  module Playlist
    class Base < YouTube::Base
      include YouTube::Utils::Playlist
      include YouTube::Utils::Pagination

      private

      def primary_args
        [@args[:playlist_id]]
      end

      def link
        "#{BASE_LINK}/playlists"
      end

      def params
        super.merge(
          playlist_params
        )
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

      def playlist_base_data
        {
          source: source_data,
          title:,
          channel: channel_data
        }.compact
      end

      def playlist
        items_list[0]
      end
    end
  end
end
