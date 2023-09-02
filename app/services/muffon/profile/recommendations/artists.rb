module Muffon
  module Profile
    module Recommendations
      class Artists < Muffon::Profile::Recommendations::Base
        COLLECTION_NAME = 'artists'.freeze
        DEFAULT_ORDER =
          'library_artists_count_desc'.freeze

        private

        def recommendations_filtered
          @recommendations_filtered ||=
            Muffon::Profile::Recommendations::Artists::Filter.call(
              filter_args
            )
        end

        def filter_args
          @args.slice(
            *%i[
              profile_id hide_library
              hide_library_tracks_count
              hide_listened tags_include
              tags_exclude artists_include
              artists_exclude
            ]
          )
        end

        def collection_list
          recommendations_filtered
            .ordered(order, DEFAULT_ORDER)
            .limit(limit)
            .offset(offset)
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
