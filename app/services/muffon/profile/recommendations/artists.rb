module Muffon
  module Profile
    module Recommendations
      class Artists < Muffon::Profile::Recommendations::Base
        DEFAULT_ORDER = 'library_artists_count_desc'.freeze

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
            .ordered(order, DEFAULT_ORDER)
            .limit(limit)
            .offset(offset)
            .associated
        end

        def artists
          @artists ||=
            Muffon::Profile::Recommendations::Artists::Filter.call(
              profile_id: @args[:profile_id],
              hide_library_artists:
                @args[:hide_library_artists].present?,
              hide_library_artists_tracks_count:
                @args[:hide_library_artists_tracks_count],
              hide_listened_artists:
                @args[:hide_listened_artists].present?,
              tags_include: @args[:tags_include],
              tags_exclude: @args[:tags_exclude],
              artists_include: @args[:artists_include],
              artists_exclude: @args[:artists_exclude]
            )
        end

        def items_count
          artists.count
        end

        def collection_item_data_formatted(
          recommendation_artist_record
        )
          Muffon::Formatter::Recommendations::Artists::Artist.call(
            recommendation_artist_record:,
            **self_args
          )
        end
      end
    end
  end
end
