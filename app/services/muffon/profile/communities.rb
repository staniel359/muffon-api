module Muffon
  module Profile
    class Communities < Muffon::Profile::Base
      COLLECTION_NAME = 'communities'.freeze
      DEFAULT_ORDER = 'joined_desc'.freeze

      include Muffon::Utils::Pagination

      private

      def profile_data
        profile_base_data
          .merge(paginated_data)
      end

      def profile_base_data
        { nickname: }
      end

      def total_items_count
        @total_items_count ||= communities.count
      end

      def communities
        @communities ||= profile.communities
      end

      def collection_list
        communities
          .with_membership_created_at
          .ordered(order, DEFAULT_ORDER)
          .limit(limit)
          .offset(offset)
          .associated
      end

      def collection_item_data_formatted(community)
        Muffon::Communities::Community.call(
          community:,
          profile_id: @args[:other_profile_id],
          token: @args[:token]
        )
      end
    end
  end
end
