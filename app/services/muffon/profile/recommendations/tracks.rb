module Muffon
  module Profile
    module Recommendations
      class Tracks < Muffon::Profile::Recommendations::Base
        DEFAULT_ORDER =
          'library_tracks_count_desc'.freeze

        private

        def recommendations_data
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
            .ordered(order, DEFAULT_ORDER)
            .limit(limit)
            .offset(offset)
        end

        def tracks
          @tracks ||=
            Muffon::Profile::Recommendations::Tracks::Filter.call(
              filter_args
            )
        end

        def filter_args
          @args.slice(
            *%i[
              profile_id
              hide_library_tracks
              hide_library_artists
              hide_library_artists_tracks_count
              hide_listened_tracks
              hide_listened_artists
            ]
          )
        end

        def items_count
          tracks.count
        end

        def collection_item_data_formatted(recommendation)
          Muffon::Profile::Recommendations::Tracks::Track.call(
            recommendation:,
            profile_id: @args[:profile_id],
            token: @args[:token]
          )
        end
      end
    end
  end
end
