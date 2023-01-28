module Muffon
  module Profile
    module Bookmarks
      class Videos < Muffon::Profile::Bookmarks::Base
        COLLECTION_NAME = 'videos'.freeze
        DEFAULT_ORDER = 'created_desc'.freeze

        include Muffon::Utils::Pagination

        private

        def total_items_count
          @total_items_count ||= videos.count
        end

        def videos
          @videos ||= profile.bookmark_videos
        end

        def collection_list
          videos
            .ordered(order, DEFAULT_ORDER)
            .limit(limit)
            .offset(offset)
        end

        def collection_item_data_formatted(bookmark_video)
          Muffon::Profile::Bookmarks::Videos::Video.call(
            bookmark_video:,
            profile_id: @args[:profile_id],
            token: @args[:token]
          )
        end
      end
    end
  end
end
