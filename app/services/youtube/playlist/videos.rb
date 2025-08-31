module YouTube
  module Playlist
    class Videos < YouTube::Playlist::Base
      COLLECTION_NAME = 'videos'.freeze

      include Muffon::Utils::Pagination

      private

      def not_found?
        playlist_info_data.blank?
      end

      def playlist_info_data
        @playlist_info_data ||=
          YouTube::Playlist::Info.call(
            playlist_id: @args[:playlist_id]
          )[:playlist]
      end

      def link
        "#{BASE_LINK}/playlistItems"
      end

      def playlist_params
        {
          playlistId: @args[:playlist_id],
          part: 'snippet',
          maxResults: limit,
          pageToken: @args[:page]
        }
      end

      def playlist_data
        {
          source: playlist_info_data[:source],
          title: playlist_info_data[:title],
          channel: playlist_info_data[:channel],
          **paginated_data
        }
      end

      def collection_item_data_formatted(video)
        YouTube::Playlist::Videos::Video.call(
          video:,
          profile_id: @args[:profile_id],
          token: @args[:token]
        )
      end

      alias collection_list items_list
    end
  end
end
