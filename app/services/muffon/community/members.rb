module Muffon
  module Community
    class Members < Muffon::Community::Base
      COLLECTION_NAME = 'members'.freeze

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
          community.members
        else
          community
            .members
            .public
        end
      end

      def collection_list
        members
          .not_deleted
          .created_desc_ordered
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
