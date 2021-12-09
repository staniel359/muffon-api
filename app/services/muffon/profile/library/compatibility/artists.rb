module Muffon
  module Profile
    module Library
      module Compatibility
        class Artists < Muffon::Profile::Library::Compatibility::Base
          COLLECTION_NAME = 'artists'.freeze

          private

          def total_items_count
            artists_count
          end

          def collection_list
            other_profile_artists_sorted
              .limit(limit)
              .offset(offset)
          end

          def other_profile_artists_sorted
            other_profile_artists_associated.order(
              profile_tracks_count: :desc,
              created_at: :asc
            )
          end

          def other_profile_artists_associated
            other_profile_artists.includes(
              :artist
            )
          end

          def other_profile_artists
            profile_artists(@args[:other_profile_id]).where(
              artist_id: common_artist_ids
            )
          end

          def collection_item_data_formatted(profile_artist)
            Muffon::Profile::Library::Compatibility::Artists::Artist.call(
              profile_artist: profile_artist
            )
          end

          alias compatibility_data paginated_data
        end
      end
    end
  end
end
