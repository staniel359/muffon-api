module Muffon
  module Profile
    module Library
      module Track
        class Albums < Muffon::Profile::Library::Track::Base
          DEFAULT_ORDER = 'created_desc'.freeze

          private

          def library_data
            {
              top_tracks_count:,
              **super
            }
          end

          def top_tracks_count
            albums
              .library_tracks_count_desc_ordered
              .first
              &.library_tracks_count || 0
          end

          def albums
            @albums ||= library_track_record.library_albums
          end

          def track_data
            Muffon::Formatter::Library::Track::Albums.call(
              library_track_record:,
              albums_data:
            )
          end

          def albums_data
            paginated_data(
              collection_name: 'albums',
              raw_collection:,
              page:,
              limit:,
              items_count:
            )
          end

          def raw_collection
            albums
              .ordered(order, DEFAULT_ORDER)
              .limit(limit)
              .offset(offset)
              .with_relations
          end

          def items_count
            albums.count
          end

          def collection_item_data_formatted(
            library_album_record
          )
            Muffon::Formatter::Library::Albums::Album.call(
              library_album_record:,
              profile_id: @args[:other_profile_id],
              token: @args[:token]
            )
          end
        end
      end
    end
  end
end
