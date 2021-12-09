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
            other_profile_tracks_sorted
              .limit(limit)
              .offset(offset)
          end

          def other_profile_tracks_sorted
            other_profile_tracks_associated.order(
              created_at: :asc
            )
          end

          def other_profile_tracks_associated
            other_profile_tracks.includes(
              :track,
              :profile_album
            )
          end

          def other_profile_tracks
            profile_tracks(@args[:other_profile_id]).where(
              track_id: common_track_ids
            )
          end

          def collection_item_data_formatted(profile_track)
            Muffon::Profile::Library::Compatibility::Tracks::Track.call(
              profile_track: profile_track
            )
          end

          alias compatibility_data paginated_data
        end
      end
    end
  end
end
