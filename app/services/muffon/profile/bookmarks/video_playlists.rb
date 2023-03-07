module Muffon
  module Profile
    module Bookmarks
      class VideoPlaylists < Muffon::Profile::Bookmarks::Base
        COLLECTION_NAME = 'video_playlists'.freeze
        DEFAULT_ORDER = 'created_desc'.freeze

        include Muffon::Utils::Pagination

        private

        def total_items_count
          @total_items_count ||=
            video_playlists.count
        end

        def video_playlists
          @video_playlists ||=
            profile.bookmark_video_playlists
        end

        def collection_list
          video_playlists
            .ordered(order, DEFAULT_ORDER)
            .limit(limit)
            .offset(offset)
        end

        def collection_item_data_formatted(bookmark_video_playlist)
          Muffon::Profile::Bookmarks::VideoPlaylists::VideoPlaylist.call(
            bookmark_video_playlist:,
            profile_id: @args[:profile_id],
            token: @args[:token]
          )
        end
      end
    end
  end
end
