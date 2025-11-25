module Muffon
  module Profile
    module Bookmarks
      class VideoChannels < Muffon::Profile::Bookmarks::Base
        private

        def bookmarks_data
          paginated_data(
            collection_name: 'video_channels',
            raw_collection:,
            page:,
            limit:,
            items_count:
          )
        end

        def raw_collection
          video_channels
            .ordered(order, DEFAULT_ORDER)
            .limit(limit)
            .offset(offset)
        end

        def video_channels
          @video_channels ||=
            profile.bookmark_video_channels
        end

        def items_count
          video_channels.count
        end

        def collection_item_data_formatted(bookmark_video_channel)
          Muffon::Profile::Bookmarks::VideoChannels::VideoChannel.call(
            bookmark_video_channel:,
            profile_id: @args[:profile_id],
            token: @args[:token]
          )
        end
      end
    end
  end
end
