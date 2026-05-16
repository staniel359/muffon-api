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

        def items_count
          artists.count
        end

        def collection_item_data_formatted(
          bookmark_artist_record
        )
          Muffon::Formatter::Bookmarks::Artists::Artist.call(
            bookmark_artist_record:,
            **self_args
          )
        end
      end
    end
  end
end
