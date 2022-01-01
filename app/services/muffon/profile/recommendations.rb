module Muffon
  module Profile
    class Recommendations < Muffon::Profile::Base
      COLLECTION_NAME = 'recommendations'.freeze
      include Muffon::Utils::Pagination

      private

      def data
        return forbidden if wrong_profile?

        super
      end

      def profile_data
        profile_base_data
          .merge(paginated_data)
      end

      def profile_base_data
        { nickname: nickname }
      end

      def total_items_count
        recommendations_filtered.size
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
        recommendations.where(
          'profile_artist_ids @> ARRAY[?]',
          filter_ids
        )
      end

      def recommendations
        profile
          .recommendations
          .not_deleted
      end

      def filter_ids
        @args[:filter_value].map(
          &:to_i
        )
      end

      def recommendations_tags_filtered
        recommendations
          .left_joins(:artist)
          .where(
            'artists.tag_ids @> ARRAY[?]',
            filter_ids
          )
      end

      def collection_list
        recommendations_filtered
          .profile_artists_count_desc_ordered
          .limit(limit)
          .offset(offset)
          .associated
      end

      def collection_item_data_formatted(recommendation)
        Muffon::Profile::Recommendations::Recommendation.call(
          recommendation:,
          profile_id: @args[:profile_id]
        )
      end
    end
  end
end
