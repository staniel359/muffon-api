module Muffon
  module Profile
    module Library
      class Artists < Muffon::Profile::Library::Base
        DEFAULT_ORDER =
          'library_tracks_count_desc'.freeze

        private

        def library_data
          {
            top_tracks_count:,
            top_albums_count:,
            **artists_data
          }
        end

        def top_tracks_count
          library_artists
            .library_tracks_count_desc_ordered
            .first
            &.library_tracks_count || 0
        end

        def top_albums_count
          library_artists
            .library_albums_count_desc_ordered
            .first
            &.library_albums_count || 0
        end

        def artists_data
          paginated_data(
            collection_name: 'artists',
            raw_collection:,
            page:,
            limit:,
            items_count:
          )
        end

        def raw_collection
          library_artists
            .ordered(order, DEFAULT_ORDER)
            .limit(limit)
            .offset(offset)
        end

        def items_count
          profile.library_artists_count
        end

        def collection_item_data_formatted(library_artist)
          Muffon::Profile::Library::Artists::Artist.call(
            library_artist:,
            profile_id: @args[:other_profile_id],
            token: @args[:token]
          )
        end
      end
    end
  end
end
