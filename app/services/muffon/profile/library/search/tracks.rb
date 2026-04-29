module Muffon
  module Profile
    module Library
      module Search
        class Tracks < Muffon::Profile::Library::Search::Base
          DEFAULT_ORDER = 'created_desc'.freeze

          private

          def library_data
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
              .ordered(order, DEFAULT_ORDER)
              .limit(limit)
              .offset(offset)
              .associated
          end

          def tracks
            @tracks ||=
              library_tracks
              .left_joins(
                track: :artist
              ).where(
                'tracks.title_downcase LIKE :query ' \
                'OR artists.name_downcase LIKE :query',
                query: query_formatted
              )
          end

          def items_count
            tracks.count
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
