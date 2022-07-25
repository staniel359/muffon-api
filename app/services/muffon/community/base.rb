module Muffon
  module Community
    class Base < Muffon::Base
      private

      def primary_args
        [@args[:community_id]]
      end

      def no_data?
        community.blank?
      end

      def community
        @community ||=
          ::Community.find_by(
            id: @args[:community_id]
          )
      end

      def data
        { community: community_data }
      end

      def community_base_data
        {
          id: community.id,
          title: community.title
        }
      end
    end
  end
end
