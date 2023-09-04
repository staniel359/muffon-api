module Muffon
  module Profile
    module Recommendation
      module Track
        class Tracks < Muffon::Profile::Recommendation::Track::Base
          COLLECTION_NAME = 'tracks'.freeze

          include Muffon::Utils::Pagination

          private

          def total_items_count
            @total_items_count ||=
              recommendation
              .library_track_ids
              .size
          end

          def collection_list
            recommendation
              .library_tracks
              .associated
              .created_desc_ordered
              .limit(limit)
              .offset(offset)
          end

          def collection_item_data_formatted(library_track)
            Muffon::Profile::Library::Tracks::Track.call(
              library_track:,
              profile_id: @args[:profile_id],
              token: @args[:token]
            )
          end

          alias recommendation_data paginated_data
        end
      end
    end
  end
end
