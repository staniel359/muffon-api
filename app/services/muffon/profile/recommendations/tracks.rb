module Muffon
  module Profile
    module Recommendations
      class Tracks < Muffon::Profile::Recommendations::Base
        COLLECTION_NAME = 'tracks'.freeze
        DEFAULT_ORDER =
          'library_tracks_count_desc'.freeze

        private

        def recommendations_filtered
          @recommendations_filtered ||=
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

        def collection_list
          recommendations_filtered
            .associated
            .ordered(order, DEFAULT_ORDER)
            .limit(limit)
            .offset(offset)
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
