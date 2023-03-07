module Muffon
  module Profile
    module Bookmarks
      class VideoPlaylists < Muffon::Profile::Bookmarks::Base
        COLLECTION_NAME = 'video_playlists'.freeze
        DEFAULT_ORDER = 'created_desc'.freeze

        private

        def bookmarks
          @bookmarks ||=
            profile.bookmark_video_playlists
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
