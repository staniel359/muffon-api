module Muffon
  module Profile
    module Library
      module Compatibility
        class Artists < Muffon::Profile::Library::Compatibility::Base
          COLLECTION_NAME = 'artists'.freeze

          private

          def compatibility_data
            compatibility_base_data
              .merge(paginated_data)
          end

          def compatibility_base_data
            {
              top_tracks_count:,
              top_albums_count:
            }
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

          def collection_list
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

          alias total_items_count artists_count
        end
      end
    end
  end
end
