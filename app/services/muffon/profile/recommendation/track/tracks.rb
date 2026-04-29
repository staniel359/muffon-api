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
              .created_desc_ordered
              .limit(limit)
              .offset(offset)
              .associated
          end

          def tracks
            recommendation_record.library_tracks
          end

          def items_count
            recommendation_record
              .library_track_ids
              .size
          end

          def collection_item_data_formatted(
            library_track_record
          )
            Muffon::Formatter::Library::Tracks::Track.call(
              library_track_record:,
              **self_args
            )
          end
        end
      end
    end
  end
end
