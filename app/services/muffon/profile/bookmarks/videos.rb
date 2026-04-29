module Muffon
  module Profile
    module Bookmarks
      class Videos < Muffon::Profile::Bookmarks::Base
        private

        def bookmarks_data
          paginated_data(
            collection_name: 'videos',
            raw_collection:,
            page:,
            limit:,
            items_count:
          )
        end

        def raw_collection
          videos
            .ordered(order, DEFAULT_ORDER)
            .limit(limit)
            .offset(offset)
        end

        def videos
          @videos ||= profile_record.bookmark_videos
        end

        def items_count
          videos.count
        end

        def collection_item_data_formatted(
          bookmark_video_record
        )
          Muffon::Formatter::Bookmarks::Videos::Video.call(
            bookmark_video_record:,
            **self_args
          )
        end
      end
    end
  end
end
