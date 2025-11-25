module Muffon
  module Profile
    module Library
      module Compatibility
        class Artists < Muffon::Profile::Library::Compatibility::Base
          private

          def compatibility_data
            {
              top_tracks_count:,
              top_albums_count:,
              **artists_data
            }
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

          def top_tracks_count
            other_profile_library_artists
              .library_tracks_count_desc_ordered
              .first
              &.library_tracks_count || 0
          end

          def other_profile_library_artists
            @other_profile_library_artists ||=
              library_artists(
                @args[:other_profile_id]
              ).where(
                artist_id: common_artist_ids
              )
          end

          def top_albums_count
            other_profile_library_artists
              .library_albums_count_desc_ordered
              .first
              &.library_albums_count || 0
          end

          def raw_collection
            other_profile_library_artists
              .library_tracks_count_desc_ordered
              .limit(limit)
              .offset(offset)
          end

          def collection_item_data_formatted(library_artist)
            Muffon::Profile::Library::Compatibility::Artists::Artist.call(
              library_artist:,
              profile_id: @args[:profile_id],
              token: @args[:token]
            )
          end

          alias items_count artists_count
        end
      end
    end
  end
end
