module Muffon
  module Profile
    module Bookmarks
      class Tracks < Muffon::Profile::Bookmarks::Base
        COLLECTION_NAME = 'tracks'.freeze
        DEFAULT_ORDER = 'created_desc'.freeze

        include Muffon::Utils::Pagination

        private

        def total_items_count
          @total_items_count ||= tracks.count
        end

        def tracks
          @tracks ||= profile.bookmark_tracks
        end

        def collection_list
          tracks
            .ordered(order, DEFAULT_ORDER)
            .limit(limit)
            .offset(offset)
            .associated
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
