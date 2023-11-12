module Muffon
  module Community
    class Members < Muffon::Community::Base
      COLLECTION_NAME = 'members'.freeze
      DEFAULT_ORDER = 'joined_desc'.freeze

      include Muffon::Utils::Pagination

      private

      def community_data
        community_base_data
          .merge(paginated_data)
      end

      def total_items_count
        @total_items_count ||= members.count
      end

      def members
        @members ||= members_conditional
      end

      def members_conditional
        if creator?
          community_members
        else
          community_members.public
        end
      end

      def community_members
        community.members
      end

      def collection_list
        members
          .not_deleted
          .with_membership_created_at
          .ordered(order, DEFAULT_ORDER)
          .limit(limit)
          .offset(offset)
          .associated
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
