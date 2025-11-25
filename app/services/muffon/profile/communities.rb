module Muffon
  module Profile
    class Communities < Muffon::Profile::Base
      DEFAULT_ORDER = 'joined_desc'.freeze

      private

      def profile_data
        {
          **super,
          **communities_data
        }
      end

      def communities_data
        paginated_data(
          collection_name: 'communities',
          raw_collection:,
          page:,
          limit:,
          items_count:
        )
      end

      def raw_collection
        communities
          .with_membership_created_at
          .ordered(order, DEFAULT_ORDER)
          .limit(limit)
          .offset(offset)
          .associated
      end

      def communities
        @communities ||= profile.communities
      end

      def items_count
        communities.count
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
