module Muffon
  module Profile
    module Library
      class Albums < Muffon::Profile::Library::Base
        DEFAULT_ORDER =
          'library_tracks_count_desc'.freeze

        private

        def library_data
          {
            top_tracks_count:,
            **albums_data
          }
        end

        def top_tracks_count
          library_albums
            .library_tracks_count_desc_ordered
            .first
            &.library_tracks_count || 0
        end

        def albums_data
          paginated_data(
            collection_name: 'albums',
            raw_collection:,
            page:,
            limit:,
            items_count:
          )
        end

        def raw_collection
          library_albums
            .ordered(order, DEFAULT_ORDER)
            .limit(limit)
            .offset(offset)
            .associated
        end

        def items_count
          profile.library_albums_count
        end

        def collection_item_data_formatted(library_album)
          Muffon::Profile::Library::Albums::Album.call(
            library_album:,
            profile_id: @args[:other_profile_id],
            token: @args[:token]
          )
        end
      end
    end
  end
end
