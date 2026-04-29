module Muffon
  module Profile
    module Library
      module Artist
        class Tracks < Muffon::Profile::Library::Artist::Base
          DEFAULT_ORDER = 'created_desc'.freeze

          private

          def artist_data
            Muffon::Formatter::Library::Artist::Tracks.call(
              library_artist_record:,
              tracks_data:
            )
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
              .ordered(order, DEFAULT_ORDER)
              .limit(limit)
              .offset(offset)
              .associated
          end

          def tracks
            library_artist_record.library_tracks
          end

          def items_count
            library_artist_record.library_tracks_count
          end

          def collection_item_data_formatted(
            library_track_record
          )
            Muffon::Formatter::Library::Artist::Tracks::Track.call(
              library_track_record:,
              profile_id: @args[:other_profile_id],
              token: @args[:token]
            )
          end
        end
      end
    end
  end
end
