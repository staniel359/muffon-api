module Muffon
  module Community
    class Base < Muffon::Base
      def call
        check_args

        check_if_not_found

        data
      end

      private

      def required_args
        %i[
          community_id
        ]
      end

      def not_found?
        community.blank?
      end

      def community
        if instance_variable_defined?(
          :@community
        )
          @community
        else
          @community =
            ::Community.find_by(
              id: community_id
            )
        end
      end

      def community_id
        @args[:community_id]
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
