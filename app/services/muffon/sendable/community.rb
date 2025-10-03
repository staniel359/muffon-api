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
          community
        ]
      end

      def data
        return {} if find_community.blank?

        {
          id: find_community.id,
          title: find_community.title,
          image: image_data,
          description:
            description_truncated_formatted,
          members_count:
            find_community.members_count
        }.compact
      end

      def description_truncated_formatted
        string_with_newlines_replaced_by_spaces(
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
        find_community.description
      end

      def find_community
        if instance_variable_defined?(
          :@find_community
        )
          @find_community
        else
          @find_community =
            ::Community.find_by(
              id: community[:id]
            )
        end
      end

      def community
        @args[:community].deep_symbolize_keys
      end

      def image_data
        community_image_data&.slice(
          :small
        )
      end

      def community_image_data
        find_community.image_data
      end
    end
  end
end
