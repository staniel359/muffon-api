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
          .with_relations
      end

      def communities
        @communities ||= profile_record.communities
      end

      def items_count
        communities.count
      end

      def collection_item_data_formatted(
        community_record
      )
        Muffon::Formatter::Communities::Community.call(
          community_record:,
          **self_args
        )
      end
    end
  end
end
