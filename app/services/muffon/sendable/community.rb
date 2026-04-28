module Muffon
  module Sendable
    class Community < Muffon::Base
      def call
        check_args

        data
      end

      private

      def required_args
        %i[
          raw_community_data
        ]
      end

      def data
        if community_record.present?
          {
            id: community_record.id,
            title: community_record.title,
            image: image_data,
            description:
              description_truncated_formatted,
            members_count:
              community_record.members_count
          }.compact
        else
          { deleted: true }
        end
      end

      def community_record
        if defined?(@community_record)
          @community_record
        else
          @community_record =
            ::Community.find_by(
              id: community_data[:id]
            )
        end
      end

      def community_data
        @args[:raw_community_data].deep_symbolize_keys
      end

      def description_truncated_formatted
        string_with_newlines_replaced_by_space(
          description_truncated
        )
      end

      def description_truncated
        text_truncated(
          description,
          size: 'extrasmall'
        )
      end

      def description
        community_record
          .description
          .presence
      end

      def image_data
        community_image_data&.slice(
          :small
        )
      end

      def community_image_data
        community_record.image_data
      end
    end
  end
end
