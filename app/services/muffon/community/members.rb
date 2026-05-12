module Muffon
  module Community
    class Members < Muffon::Community::Base
      DEFAULT_ORDER = 'joined_desc'.freeze

      include Muffon::Mixins::Profile

      private

      def community_data
        {
          **super,
          **members_data
        }
      end

      def members_data
        paginated_data(
          collection_name: 'members',
          raw_collection:,
          page:,
          limit:,
          items_count:
        )
      end

      def raw_collection
        members
          .with_membership_created_at
          .ordered(order, DEFAULT_ORDER)
          .limit(limit)
          .offset(offset)
          .with_relations
      end

      def members
        @members ||=
          if creator?
            community_record
              .members
              .not_deleted
          else
            community_record
              .members
              .public
              .not_deleted
          end
      end

      def items_count
        members.count
      end

      def collection_item_data_formatted(
        profile_record
      )
        Muffon::Formatter::Profiles::Profile.call(
          profile_record:,
          **self_args
        )
      end
    end
  end
end
