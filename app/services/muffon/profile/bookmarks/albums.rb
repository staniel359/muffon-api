module Muffon
  module Profile
    module Bookmarks
      class Albums < Muffon::Profile::Bookmarks::Base
        private

        def bookmarks_data
          paginated_data(
            collection_name: 'albums',
            raw_collection:,
            page:,
            limit:,
            items_count:
          )
        end

        def raw_collection
          albums
            .ordered(order, DEFAULT_ORDER)
            .limit(limit)
            .offset(offset)
            .associated
        end

        def albums
          @albums ||= profile.bookmark_albums
        end

        def items_count
          albums.count
        end

        def collection_item_data_formatted(bookmark_album)
          Muffon::Profile::Bookmarks::Albums::Album.call(
            bookmark_album:,
            profile_id: @args[:profile_id],
            token: @args[:token]
          )
        end
      end
    end
  end
end
