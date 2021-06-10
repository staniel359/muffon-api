module YouTube
  module Playlist
    class Base < YouTube::Base
      include YouTube::Utils::Pagination

      private

      def primary_args
        [@args.playlist_id]
      end

      def link
        "#{BASE_LINK}/playlistItems"
      end

      def params
        super.merge(playlist_params)
      end

      def playlist_params
        {
          playlistId: @args.playlist_id,
          part: 'snippet',
          maxResults: limit,
          pageToken: @args.next_page
        }
      end

      def data
        { playlist: playlist_data }
      end
    end
  end
end
