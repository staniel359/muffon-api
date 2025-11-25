module Muffon
  module Profile
    module Bookmarks
      class Artists < Muffon::Profile::Bookmarks::Base
        private

        def bookmarks_data
          paginated_data(
            collection_name: 'artists',
            raw_collection:,
            page:,
            limit:,
            items_count:
          )
        end

        def raw_collection
          artists
            .ordered(order, DEFAULT_ORDER)
            .limit(limit)
            .offset(offset)
        end

        def artists
          @artists ||= profile.bookmark_artists
        end

        def items_count
          artists.count
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
