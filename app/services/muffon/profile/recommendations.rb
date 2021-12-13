module Muffon
  module Profile
    class Recommendations < Muffon::Profile::Base
      include Muffon::Utils::Pagination

      private

      def data
        return forbidden if wrong_profile?

        super
      end

      def profile_data
        {
          nickname: nickname,
          page: page,
          total_pages: total_pages_count,
          recommendations: recommendations_formatted
        }
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
            recommendations_associated
          end
      end

      def recommendations_artists_filtered
        recommendations_associated.where(
          'profile_artist_ids @> ARRAY[?]',
          filter_ids
        )
      end

      def recommendations_associated
        recommendations.includes(
          :artist
        )
      end

      def recommendations
        profile
          .recommendations
          .not_deleted
      end

      def filter_ids
        @args[:filter_value].map(&:to_i)
      end

      def recommendations_tags_filtered
        recommendations_associated
          .left_joins(:artist)
          .where(
            'artists.tag_ids @> ARRAY[?]',
            filter_ids
          )
      end

      def recommendations_formatted
        recommendations_paginated.map do |r|
          recommendation_formatted(r)
        end
      end

      def recommendations_paginated
        recommendations_sorted
          .limit(limit)
          .offset(offset)
      end

      def recommendations_sorted
        recommendations_filtered
          .select(
            'recommendations.*,'\
            ' ARRAY_LENGTH(profile_artist_ids, 1)'\
            ' as profile_artist_ids_size'
          )
          .order(
            'profile_artist_ids_size DESC,'\
            ' recommendations.created_at ASC'
          )
      end

      def recommendation_formatted(recommendation)
        Muffon::Profile::Recommendations::Recommendation.call(
          recommendation: recommendation,
          profile_id: @args[:profile_id]
        )
      end
    end
  end
end
