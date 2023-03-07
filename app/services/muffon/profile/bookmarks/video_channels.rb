module Muffon
  module Profile
    module Bookmarks
      class VideoChannels < Muffon::Profile::Bookmarks::Base
        COLLECTION_NAME = 'video_channels'.freeze
        DEFAULT_ORDER = 'created_desc'.freeze

        private

        def bookmarks
          @bookmarks ||=
            profile.bookmark_video_channels
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
