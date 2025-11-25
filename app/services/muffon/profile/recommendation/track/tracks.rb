module Muffon
  module Profile
    module Recommendation
      module Track
        class Tracks < Muffon::Profile::Recommendation::Track::Base
          private

          def recommendation_data
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
            tracks
              .associated
              .created_desc_ordered
              .limit(limit)
              .offset(offset)
          end

          def tracks
            recommendation.library_tracks
          end

          def items_count
            recommendation
              .library_track_ids
              .size
          end

          def collection_item_data_formatted(library_track)
            Muffon::Profile::Library::Tracks::Track.call(
              library_track:,
              profile_id: @args[:profile_id],
              token: @args[:token]
            )
          end
        end
      end
    end
  end
end
