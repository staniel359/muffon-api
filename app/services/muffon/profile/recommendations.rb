module Muffon
  module Profile
    class Recommendations < Muffon::Profile::Base
      COLLECTION_NAME = 'recommendations'.freeze
      DEFAULT_ORDER =
        'library_artists_count_desc'.freeze

      include Muffon::Utils::Pagination

      private

      def forbidden?
        !valid_profile?
      end

      def profile_data
        profile_base_data
          .merge(paginated_data)
      end

      def profile_base_data
        { nickname: }
      end

      def total_items_count
        @total_items_count ||=
          recommendations_filtered.count
      end

      def recommendations_filtered
        @recommendations_filtered ||=
          Muffon::Profile::Recommendations::Filter.call(
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
        Muffon::Profile::Recommendations::Recommendation.call(
          recommendation:,
          profile_id: @args[:profile_id],
          token: @args[:token]
        )
      end
    end
  end
end
