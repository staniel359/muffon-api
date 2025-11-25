module Muffon
  module Profile
    module Bookmarks
      class Tracks < Muffon::Profile::Bookmarks::Base
        private

        def bookmarks_data
          paginated_data(
            collection_name: 'tracks',
            raw_collection:,
            page:,
            limit:,
            items_count:
          )
        end

        def raw_collection
          tracks
            .ordered(order, DEFAULT_ORDER)
            .limit(limit)
            .offset(offset)
            .associated
        end

        def tracks
          @tracks ||= profile.bookmark_tracks
        end

        def items_count
          tracks.count
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
