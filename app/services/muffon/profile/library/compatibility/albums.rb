module Muffon
  module Profile
    module Library
      module Compatibility
        class Albums < Muffon::Profile::Library::Compatibility::Base
          COLLECTION_NAME = 'albums'.freeze

          private

          def compatibility_data
            compatibility_base_data
              .merge(paginated_data)
          end

          def compatibility_base_data
            { top_tracks_count: }
          end

          def top_tracks_count
            other_profile_library_albums
              .library_tracks_count_desc_ordered
              .first
              &.library_tracks_count || 0
          end

          def other_profile_library_albums
            @other_profile_library_albums ||=
              library_albums(
                @args[:other_profile_id]
              ).where(
                album_id: common_album_ids
              )
          end

          def collection_list
            other_profile_library_albums
              .library_tracks_count_desc_ordered
              .limit(limit)
              .offset(offset)
              .associated
          end

          def collection_item_data_formatted(library_album)
            Muffon::Profile::Library::Compatibility::Albums::Album.call(
              library_album:,
              profile_id: @args[:profile_id],
              token: @args[:token]
            )
          end

          alias total_items_count albums_count
        end
      end
    end
  end
end
