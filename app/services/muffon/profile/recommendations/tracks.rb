module Muffon
  module Profile
    module Recommendations
      class Tracks < Muffon::Profile::Recommendations::Base
        DEFAULT_ORDER = 'library_tracks_count_desc'.freeze

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
            .ordered(order, DEFAULT_ORDER)
            .limit(limit)
            .offset(offset)
            .associated
        end

        def tracks
          @tracks ||=
            Muffon::Profile::Recommendations::Tracks::Filter.call(
              profile_id: @args[:profile_id],
              hide_library_tracks:
                @args[:hide_library_tracks].present?,
              hide_library_artists:
                @args[:hide_library_artists].present?,
              hide_library_artists_tracks_count:
                @args[:hide_library_artists_tracks_count],
              hide_listened_tracks:
                @args[:hide_listened_tracks].present?,
              hide_listened_artists:
                @args[:hide_listened_artists].present?
            )
        end

        def items_count
          tracks.count
        end

        def collection_item_data_formatted(
          recommendation_track_record
        )
          Muffon::Formatter::Recommendations::Tracks::Track.call(
            recommendation_track_record:,
            **self_args
          )
        end
      end
    end
  end
end
