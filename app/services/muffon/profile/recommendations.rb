module Muffon
  module Profile
    class Recommendations < Muffon::Profile::Base
      COLLECTION_NAME = 'recommendations'.freeze
      DEFAULT_ORDER = 'library_artists_count_desc'.freeze

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
          case @args[:filter]
          when 'artists'
            recommendations_artists_filtered
          when 'tags'
            recommendations_tags_filtered
          else
            recommendations
          end
      end

      def recommendations_artists_filtered
        Muffon::Profile::Recommendations::Filter::Artists.call(
          profile_id: @args[:profile_id],
          filter_value: @args[:filter_value]
        )
      end

      def recommendations_tags_filtered
        Muffon::Profile::Recommendations::Filter::Tags.call(
          profile_id: @args[:profile_id],
          filter_value: @args[:filter_value]
        )
      end

      def recommendations
        Muffon::Profile::Recommendations::Hide.call(
          hide_args
        )
      end

      def hide_args
        @args.slice(
          *%i[
            hide_library_artists
            hide_listened_artists
            profile_id tracks_count
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
