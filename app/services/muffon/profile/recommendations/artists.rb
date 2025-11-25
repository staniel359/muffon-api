module Muffon
  module Profile
    module Recommendations
      class Artists < Muffon::Profile::Recommendations::Base
        DEFAULT_ORDER =
          'library_artists_count_desc'.freeze

        private

        def recommendations_data
          {
            **artists_data
          }
        end

        def artists_data
          paginated_data(
            collection_name: 'artists',
            raw_collection:,
            page:,
            limit:,
            items_count:
          )
        end

        def raw_collection
          artists
            .associated
            .ordered(order, DEFAULT_ORDER)
            .limit(limit)
            .offset(offset)
        end

        def artists
          @artists ||=
            Muffon::Profile::Recommendations::Artists::Filter.call(
              filter_args
            )
        end

        def filter_args
          @args.slice(
            *%i[
              profile_id
              hide_library_artists
              hide_library_artists_tracks_count
              hide_listened_artists
              tags_include
              tags_exclude
              artists_include
              artists_exclude
            ]
          )
        end

        def items_count
          artists.count
        end

        def collection_item_data_formatted(recommendation)
          Muffon::Profile::Recommendations::Artists::Artist.call(
            recommendation:,
            profile_id: @args[:profile_id],
            token: @args[:token]
          )
        end
      end
    end
  end
end
