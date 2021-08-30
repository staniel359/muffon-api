module Muffon
  module Profile
    class Recommendations < Muffon::Profile::Base
      include Muffon::Utils::Pagination

      private

      def data
        return forbidden if wrong_profile?

        { profile: profile_data }
      end

      def profile_data
        {
          nickname: nickname,
          page: page,
          total_pages: total_pages_count,
          recommendations: recommendations_formatted
        }
      end

      def nickname
        profile.nickname
      end

      def total_items_count
        recommendations.size
      end

      def recommendations
        @recommendations ||=
          profile.recommendations.where.not(
            deleted: true
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
        recommendations_associated
          .select(
            '*, ARRAY_LENGTH(profile_artist_ids, 1)'\
            'as profile_artist_ids_size'
          )
          .order(
            'profile_artist_ids_size DESC, id DESC'
          )
      end

      def recommendations_associated
        recommendations
          .includes(:artist)
      end

      def recommendation_formatted(recommendation)
        Muffon::Profile::Recommendations::Recommendation.call(
          recommendation: recommendation,
          profile_id: @args.profile_id
        )
      end
    end
  end
end
