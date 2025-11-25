module Muffon
  module Community
    class Members < Muffon::Community::Base
      DEFAULT_ORDER = 'joined_desc'.freeze

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
          .associated
      end

      def members
        @members ||=
          if creator?
            community
              .members
              .not_deleted
          else
            community
              .members
              .public
              .not_deleted
          end
      end

      def items_count
        members.count
      end

      def collection_item_data_formatted(profile)
        Muffon::Profiles::Profile.call(
          profile:,
          other_profile_id: @args[:profile_id],
          token: @args[:token]
        )
      end
    end
  end
end
