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
        community_record.blank?
      end

      def community_record
        if defined?(@community_record)
          @community_record
        else
          @community_record =
            ::Community.find_by(
              id: @args[:community_id]
            )
        end
      end

      def data
        { community: community_data }
      end

      def community_data
        {
          id: community_record.id,
          title: community_record.title
        }
      end
    end
  end
end
