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
        community.members_count
      end

      def collection_list
        community
          .members
          .created_desc_ordered
          .limit(limit)
          .offset(offset)
          .associated
      end

      def collection_item_data_formatted(profile)
        Muffon::Profiles::Profile.call(
          profile:,
          other_profile_id:
            @args[:other_profile_id]
        )
      end
    end
  end
end
