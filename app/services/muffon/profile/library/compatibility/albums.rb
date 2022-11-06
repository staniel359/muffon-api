module Muffon
  module Profile
    module Library
      module Compatibility
        class Albums < Muffon::Profile::Library::Compatibility::Base
          COLLECTION_NAME = 'albums'.freeze

          private

          def collection_list
            other_profile_library_albums
              .library_tracks_count_desc_ordered
              .limit(limit)
              .offset(offset)
              .associated
          end

          def other_profile_library_albums
            library_albums(
              @args[:other_profile_id]
            ).where(
              album_id: common_album_ids
            )
          end

          def collection_item_data_formatted(library_album)
            Muffon::Profile::Library::Compatibility::Albums::Album.call(
              library_album:,
              token: @args[:token]
            )
          end

          alias compatibility_data paginated_data
          alias total_items_count albums_count
        end
      end
    end
  end
end
