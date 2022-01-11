module Muffon
  module Profile
    class Communities < Muffon::Profile::Base
      COLLECTION_NAME = 'communities'.freeze
      include Muffon::Utils::Pagination

      private

      def profile_data
        profile_base_data
          .merge(paginated_data)
      end

      def profile_base_data
        { nickname: nickname }
      end

      def total_items_count
        communities.size
      end

      def communities
        @communities ||= profile.communities
      end

      def collection_list
        communities
          .created_desc_ordered
          .limit(limit)
          .offset(offset)
          .associated
      end

      def collection_item_data_formatted(community)
        Muffon::Communities::Community.call(
          community:
        )
      end
    end
  end
end
