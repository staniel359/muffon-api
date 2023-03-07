module Muffon
  module Profile
    module Bookmarks
      class Videos < Muffon::Profile::Bookmarks::Base
        COLLECTION_NAME = 'videos'.freeze
        DEFAULT_ORDER = 'created_desc'.freeze

        private

        def bookmarks
          @bookmarks ||=
            profile.bookmark_videos
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
