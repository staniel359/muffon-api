module Muffon
  module Profile
    module Bookmarks
      class VideoPlaylists < Muffon::Profile::Bookmarks::Base
        private

        def bookmarks_data
          paginated_data(
            collection_name: 'video_playlists',
            raw_collection:,
            page:,
            limit:,
            items_count:
          )
        end

        def raw_collection
          video_playlists
            .ordered(order, DEFAULT_ORDER)
            .limit(limit)
            .offset(offset)
        end

        def video_playlists
          @video_playlists ||=
            profile_record.bookmark_video_playlists
        end

        def items_count
          video_playlists.count
        end

        def collection_item_data_formatted(
          bookmark_video_playlist_record
        )
          Muffon::Formatter::Bookmarks::VideoPlaylists::VideoPlaylist.call(
            bookmark_video_playlist_record:,
            **self_args
          )
        end
      end
    end
  end
end
