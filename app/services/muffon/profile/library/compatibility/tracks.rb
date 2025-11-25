module Muffon
  module Profile
    module Library
      module Compatibility
        class Tracks < Muffon::Profile::Library::Compatibility::Base
          private

          def compatibility_data
            {
              **tracks_data
            }
          end

          def tracks_data
            paginated_data(
              collection_name: 'tracks',
              raw_collection:,
              page:,
              limit:,
              items_count:
            )
          end

          def raw_collection
            other_profile_library_tracks
              .created_desc_ordered
              .limit(limit)
              .offset(offset)
              .associated
          end

          def other_profile_library_tracks
            library_tracks(
              @args[:other_profile_id]
            ).where(
              track_id: common_track_ids
            )
          end

          def collection_item_data_formatted(library_track)
            Muffon::Profile::Library::Compatibility::Tracks::Track.call(
              library_track:,
              profile_id: @args[:profile_id],
              token: @args[:token]
            )
          end

          alias items_count tracks_count
        end
      end
    end
  end
end
