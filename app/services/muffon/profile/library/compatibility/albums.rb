module Muffon
  module Profile
    module Library
      module Compatibility
        class Albums < Muffon::Profile::Library::Compatibility::Base
          COLLECTION_NAME = 'albums'.freeze

          private

          def total_items_count
            albums_count
          end

          def collection_list
            other_profile_albums_sorted
              .limit(limit)
              .offset(offset)
          end

          def other_profile_albums_sorted
            other_profile_albums_associated.order(
              profile_tracks_count: :desc,
              created_at: :asc
            )
          end

          def other_profile_albums_associated
            other_profile_albums.includes(
              :album
            )
          end

          def other_profile_albums
            profile_albums(@args[:other_profile_id]).where(
              album_id: common_album_ids
            )
          end

          def collection_item_data_formatted(profile_album)
            Muffon::Profile::Library::Compatibility::Albums::Album.call(
              profile_album: profile_album
            )
          end

          alias compatibility_data paginated_data
        end
      end
    end
  end
end
