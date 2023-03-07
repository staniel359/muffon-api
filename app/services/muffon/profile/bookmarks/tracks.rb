module Muffon
  module Profile
    module Bookmarks
      class Tracks < Muffon::Profile::Bookmarks::Base
        COLLECTION_NAME = 'tracks'.freeze
        DEFAULT_ORDER = 'created_desc'.freeze

        private

        def bookmarks
          @bookmarks ||=
            profile.bookmark_tracks
        end

        def collection_list
          super.associated
        end

        def collection_item_data_formatted(bookmark_track)
          Muffon::Profile::Bookmarks::Tracks::Track.call(
            bookmark_track:,
            profile_id: @args[:profile_id],
            token: @args[:token]
          )
        end
      end
    end
  end
end
