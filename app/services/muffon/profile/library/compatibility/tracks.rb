module Muffon
  module Profile
    module Library
      module Compatibility
        class Tracks < Muffon::Profile::Library::Compatibility::Base
          COLLECTION_NAME = 'tracks'.freeze

          private

          def total_items_count
            tracks_count
          end

          def collection_list
            other_profile_tracks
              .created_desc_ordered
              .limit(limit)
              .offset(offset)
              .associated
          end

          def other_profile_tracks
            profile_tracks(
              @args[:other_profile_id]
            ).where(
              track_id: common_track_ids
            )
          end

          def collection_item_data_formatted(profile_track)
            Muffon::Profile::Library::Compatibility::Tracks::Track.call(
              profile_track:
            )
          end

          alias compatibility_data paginated_data
        end
      end
    end
  end
end
