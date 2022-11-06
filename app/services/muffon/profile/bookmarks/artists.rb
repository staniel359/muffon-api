module Muffon
  module Profile
    module Bookmarks
      class Artists < Muffon::Profile::Bookmarks::Base
        COLLECTION_NAME = 'artists'.freeze
        DEFAULT_ORDER = 'created_desc'.freeze

        include Muffon::Utils::Pagination

        private

        def total_items_count
          @total_items_count ||= artists.count
        end

        def artists
          @artists ||= profile.bookmark_artists
        end

        def collection_list
          artists
            .ordered(order, DEFAULT_ORDER)
            .limit(limit)
            .offset(offset)
        end

        def collection_item_data_formatted(bookmark_artist)
          Muffon::Profile::Bookmarks::Artists::Artist.call(
            bookmark_artist:,
            profile_id: @args[:profile_id],
            token: @args[:token]
          )
        end
      end
    end
  end
end
